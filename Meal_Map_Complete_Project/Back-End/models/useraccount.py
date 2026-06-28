import sys
import os
import bcrypt
from datetime import datetime
from config import get_db

sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))


class UserAccount:

    def __init__(self,
                 Id=None,
                 FirstName=None,
                 LastName=None,
                 Email=None,
                 ContactNo=None,
                 Password=None,
                 Role="user"):
        self.Id = Id
        self.FirstName = FirstName
        self.LastName = LastName
        self.Email = Email
        self.ContactNo = ContactNo
        self.Password = Password
        self.Role = Role

    @staticmethod
    def hash_password(password):
        if not password:
            return None
        salt = bcrypt.gensalt()
        hashed = bcrypt.hashpw(password.encode('utf-8'), salt)
        return hashed.decode('utf-8')

    @staticmethod
    def get_by_email(email):
        db = get_db()
        cursor = db.cursor(buffered=True)
        sql = "SELECT * FROM useraccount WHERE Email=%s"
        cursor.execute(sql, (email, ))
        row = cursor.fetchone()
        cursor.close()
        db.close()
        return row

    @staticmethod
    def verify_login(email, password):
        db = get_db()
        cursor = db.cursor(buffered=True)
        sql = "SELECT * FROM useraccount WHERE Email=%s"
        cursor.execute(sql, (email, ))
        row = cursor.fetchone()
        cursor.close()
        db.close()

        if row:
            stored_hash = row[5]  # PasswordHash column (index 5)

            # Guard: account has no password set (e.g. Google OAuth-only users)
            if not stored_hash:
                return False, None

            # Guard: legacy MD5/SHA hashes are not bcrypt — reject immediately
            # instead of letting bcrypt raise ValueError with a confusing error.
            if not stored_hash.startswith("$2"):
                # Hash is not bcrypt — password was never properly set for this
                # account. Return False so the caller gets "invalid credentials".
                return False, None

            try:
                if bcrypt.checkpw(password.encode('utf-8'), stored_hash.encode('utf-8')):
                    return True, row
            except (ValueError, Exception):
                pass

        return False, None

    def register_user(self):
        db = get_db()
        cursor = db.cursor(buffered=True)
        self.PasswordHash = self.hash_password(self.Password)
        sql = """
            INSERT INTO useraccount
            (FirstName, LastName, Email, ContactNo, PasswordHash, Role, IsEmailVerified, CreatedAt)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
        """
        val = (self.FirstName, self.LastName, self.Email, self.ContactNo,
               self.PasswordHash, self.Role, 0, datetime.now())
        try:
            cursor.execute(sql, val)
            db.commit()
            self.Id = cursor.lastrowid
            cursor.close()
            db.close()
            return True, self.get_by_email(self.Email)
        except Exception as e:
            print("Error registering user:", e)
            try:
                cursor.close()
            except:
                pass
            try:
                db.close()
            except:
                pass
            return False, None

    @staticmethod
    def row_to_dict(row):
        if not row:
            return None
        print("Row data:", row)
        keys = [
            "Id", "FirstName", "LastName", "Email", "ContactNo",
            "PasswordHash", "IsEmailVerified", "Role", "Status",
            "ProfileImageURL", "CreatedAt", "UpdatedAt"
        ]
        return dict(zip(keys, row))

    @staticmethod
    def get_user_by_id(user_id):
        db = get_db()
        cursor = db.cursor(buffered=True)
        sql = "SELECT * FROM useraccount WHERE Id=%s"
        cursor.execute(sql, (user_id, ))
        row = cursor.fetchone()
        cursor.close()
        db.close()
        return UserAccount.row_to_dict(row)

    @staticmethod
    def get_all_users():
        db = get_db()
        cursor = db.cursor(buffered=True)
        sql = "SELECT * FROM useraccount"
        cursor.execute(sql)
        rows = cursor.fetchall()
        cursor.close()
        db.close()
        return [UserAccount.row_to_dict(r) for r in rows]

    # ---------------- FAVORITES ----------------
    @staticmethod
    def add_favorite(user_id, restaurant_id):
        db = get_db()
        cursor = db.cursor()
        try:
            sql = "INSERT IGNORE INTO favorite (UserID, RestaurantID, CreatedAt) VALUES (%s, %s, %s)"
            cursor.execute(sql, (user_id, restaurant_id, datetime.now()))
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

    @staticmethod
    def remove_favorite(user_id, restaurant_id):
        db = get_db()
        cursor = db.cursor()
        try:
            sql = "DELETE FROM favorite WHERE UserID=%s AND RestaurantID=%s"
            cursor.execute(sql, (user_id, restaurant_id))
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

    @staticmethod
    def get_favorites(user_id):
        db = get_db()
        cursor = db.cursor(dictionary=True)
        sql = """
            SELECT r.RestaurantID, r.Name, r.PriceRange, r.AvgRating, r.TotalRatings
            FROM restaurant r
            INNER JOIN favorite f ON r.RestaurantID = f.RestaurantID
            WHERE f.UserID=%s
        """
        cursor.execute(sql, (user_id, ))
        rows = cursor.fetchall()
        cursor.close()
        db.close()
        return rows

    @staticmethod
    def get_dashboard_metrics(user_id):
        db = get_db()
        cursor = db.cursor(dictionary=True)
        sql = """
            SELECT 
                COUNT(*) AS TotalFavorites,
                (SELECT COUNT(*) 
                    FROM reservation 
                    WHERE UserID = %s AND ReservationTime >= NOW()) AS UpcomingReservations,
                (SELECT COUNT(*) 
                    FROM reservation 
                    WHERE UserID = %s) AS TotalReservations,
                (SELECT COUNT(*) 
                    FROM rating 
                    WHERE UserID = %s) AS TotalReviews
            FROM favorite 
            WHERE UserID = %s;

        """
        cursor.execute(sql, (user_id, user_id, user_id, user_id))
        rows = cursor.fetchall()
        cursor.close()
        db.close()
        return rows
    
    # ---------------- PROFILE UPDATE ----------------
    @staticmethod
    def update_profile(user_id, **kwargs):
        db = get_db()
        cursor = db.cursor()
        fields = []
        values = []

        for key in ["FirstName", "LastName", "ContactNo", "ProfileImageURL"]:
            if key in kwargs:
                fields.append(f"{key}=%s")
                values.append(kwargs[key])

        if "Password" in kwargs and kwargs["Password"]:
            fields.append("PasswordHash=%s")
            values.append(UserAccount.hash_password(kwargs["Password"]))

        if not fields:
            cursor.close()
            db.close()
            return False

        values.append(user_id)
        sql = f"UPDATE useraccount SET {', '.join(fields)}, UpdatedAt=%s WHERE Id=%s"
        values.insert(-1, datetime.now())
        try:
            cursor.execute(sql, tuple(values))
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
