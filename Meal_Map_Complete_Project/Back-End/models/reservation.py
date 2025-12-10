# backend/models/reservation.py
import sys
import os
from datetime import datetime, timedelta
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
from config import get_db

class Reservation:
    def __init__(self, ReservationID=None, RestaurantID=None, UserID=None, TableID=None,
                 GuestCount=1, ReservationTime=None, Status="Pending", Notes=None, CreatedAt=None):
        self.ReservationID = ReservationID
        self.RestaurantID = RestaurantID
        self.UserID = UserID
        self.TableID = TableID
        self.GuestCount = GuestCount
        self.ReservationTime = ReservationTime
        self.Status = Status
        self.Notes = Notes
        self.CreatedAt = CreatedAt

    # Get all tables for a restaurant
    @staticmethod
    def get_tables_for_restaurant(restaurant_id):
        db = get_db()
        cursor = db.cursor(buffered=True)
        cursor.execute(
            "SELECT TableID, TableNumber, Capacity, IsAvailable FROM restauranttable WHERE RestaurantID=%s",
            (restaurant_id,)
        )
        rows = cursor.fetchall()
        cursor.close()
        db.close()
        return [{"TableID": r[0], "TableNumber": r[1], "Capacity": r[2], "IsAvailable": r[3]} for r in rows]

    # Check if table is available at reservation time
    @staticmethod
    def is_table_available(table_id, reservation_time):
        if isinstance(reservation_time, datetime):
            reservation_time = reservation_time.strftime("%Y-%m-%d %H:%M:%S")
        db = get_db()
        cursor = db.cursor(buffered=True)
        cursor.execute(
            "SELECT COUNT(*) FROM reservation WHERE TableID=%s AND ReservationTime=%s AND Status IN ('Pending','Confirmed')",
            (table_id, reservation_time)
        )
        count = cursor.fetchone()[0]
        cursor.close()
        db.close()
        return count == 0

    # Auto-assign table if TableID not provided
    @staticmethod
    def assign_table(restaurant_id, guest_count, reservation_time):
        db = get_db()
        cursor = db.cursor(buffered=True)
        cursor.execute(
            "SELECT TableID, Capacity FROM restauranttable WHERE RestaurantID=%s AND IsAvailable=1 AND Capacity >= %s ORDER BY Capacity ASC",
            (restaurant_id, guest_count)
        )
        tables = cursor.fetchall()
        cursor.close()
        db.close()
        for t in tables:
            table_id, cap = t
            if Reservation.is_table_available(table_id, reservation_time):
                return table_id
        return None

    # Add reservation
    def add_reservation(self):
        # if no table assigned, auto-assign
        if not self.TableID:
            self.TableID = Reservation.assign_table(self.RestaurantID, self.GuestCount, self.ReservationTime)
            if not self.TableID:
                return False, "No available table for this restaurant at requested time and guest count"

        # validate table exists for this restaurant
        db = get_db()
        cursor = db.cursor(buffered=True)
        cursor.execute("SELECT TableID FROM restauranttable WHERE TableID=%s AND RestaurantID=%s",
                       (self.TableID, self.RestaurantID))
        exists = cursor.fetchone()
        cursor.close()
        if not exists:
            db.close()
            return False, "Invalid TableID for this restaurant"

        # check table availability
        if not Reservation.is_table_available(self.TableID, self.ReservationTime):
            db.close()
            return False, "Table already reserved for that time"

        # insert
        cursor = db.cursor(buffered=True)
        sql = """
        INSERT INTO reservation
        (RestaurantID, UserID, TableID, GuestCount, ReservationTime, Status, CreatedAt, Notes)
        VALUES (%s,%s,%s,%s,%s,%s,%s,%s)
        """
        created_at = datetime.now()
        try:
            cursor.execute(sql, (
                self.RestaurantID, self.UserID, self.TableID,
                self.GuestCount, self.ReservationTime,
                self.Status, created_at, self.Notes
            ))
            db.commit()
            self.ReservationID = cursor.lastrowid
            cursor.close()
            db.close()
            return True, Reservation.get_by_id(self.ReservationID)
        except Exception as e:
            try:
                cursor.close()
            except:
                pass
            try:
                db.close()
            except:
                pass
            return False, str(e)

    # Get reservation by ID
    @staticmethod
    def get_by_id(reservation_id):
        db = get_db()
        cursor = db.cursor(buffered=True)
        cursor.execute(
            """SELECT ReservationID, RestaurantID, UserID, TableID, GuestCount,
                      ReservationTime, Status, CreatedAt, Notes
               FROM reservation WHERE ReservationID=%s""",
            (reservation_id,)
        )
        r = cursor.fetchone()
        cursor.close()
        db.close()
        if not r:
            return None
        keys = ["ReservationID","RestaurantID","UserID","TableID","GuestCount",
                "ReservationTime","Status","CreatedAt","Notes"]
        return dict(zip(keys, r))

    # Get reservations for a user
    @staticmethod
    def get_for_user(user_id):
        db = get_db()
        cursor = db.cursor(buffered=True)
        cursor.execute(
            """SELECT ReservationID, rs.RestaurantID, rt.Name,rt.email,rt.phone, UserID, TableID, GuestCount,
                      ReservationTime, Status, rs.CreatedAt, Notes
               FROM reservation rs 
               Left Join restaurant rt ON rs.RestaurantID = rt.RestaurantID 
               WHERE UserID=%s ORDER BY ReservationTime DESC""",
            (user_id,)
        )
        rows = cursor.fetchall()
        cursor.close()
        db.close()
        keys = ["ReservationID","RestaurantID", "RestaurantName","Email","Phone","UserID","TableID","GuestCount",
                "ReservationTime","Status","CreatedAt","Notes"]
        return [dict(zip(keys, r)) for r in rows]

    # Cancel reservation
    @staticmethod
    def cancel_reservation(reservation_id):
        db = get_db()
        cursor = db.cursor(buffered=True)
        try:
            cursor.execute("UPDATE reservation SET Status='Cancelled' WHERE ReservationID=%s", (reservation_id,))
            db.commit()
            cursor.close()
            db.close()
            return True
        except:
            try:
                cursor.close()
            except:
                pass
            try:
                db.close()
            except:
                pass
            return False

    # Get reservations for a restaurant (owner view)
    @staticmethod
    def get_for_restaurant(restaurant_id, status_filter=None):
        db = get_db()
        cursor = db.cursor(buffered=True)
        if status_filter:
            cursor.execute(
                """SELECT 
                    r.ReservationID, r.RestaurantID, r.UserID, r.TableID, r.GuestCount,
                    r.ReservationTime, r.Status, r.CreatedAt, r.Notes,
                    u.FirstName, u.LastName, u.Email, u.ContactNo,
                    rt.TableNumber
                   FROM reservation r
                   LEFT JOIN useraccount u ON r.UserID = u.Id
                   LEFT JOIN restauranttable rt ON r.TableID = rt.TableID
                   WHERE r.RestaurantID=%s AND r.Status=%s 
                   ORDER BY r.ReservationTime DESC""",
                (restaurant_id, status_filter)
            )
        else:
            cursor.execute(
                """SELECT 
                    r.ReservationID, r.RestaurantID, r.UserID, r.TableID, r.GuestCount,
                    r.ReservationTime, r.Status, r.CreatedAt, r.Notes,
                    u.FirstName, u.LastName, u.Email, u.ContactNo,
                    rt.TableNumber
                   FROM reservation r
                   LEFT JOIN useraccount u ON r.UserID = u.Id
                   LEFT JOIN restauranttable rt ON r.TableID = rt.TableID
                   WHERE r.RestaurantID=%s 
                   ORDER BY r.ReservationTime DESC""",
                (restaurant_id,)
            )
        rows = cursor.fetchall()
        cursor.close()
        db.close()
        
        keys = ["ReservationID","RestaurantID","UserID","TableID","GuestCount",
                "ReservationTime","Status","CreatedAt","Notes",
                "CustomerFirstName","CustomerLastName","CustomerEmail","CustomerPhone",
                "TableNumber"]
        return [dict(zip(keys, r)) for r in rows]

    # Confirm reservation (owner action)
    @staticmethod
    def confirm_reservation(reservation_id):
        db = get_db()
        cursor = db.cursor(buffered=True)
        try:
            cursor.execute("UPDATE reservation SET Status='Confirmed' WHERE ReservationID=%s", (reservation_id,))
            db.commit()
            affected = cursor.rowcount
            cursor.close()
            return affected > 0
        except:
            cursor.close()
            return False
