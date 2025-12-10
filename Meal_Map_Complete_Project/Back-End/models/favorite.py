# backend/models/favorite.py

import sys
import os
from config import get_db
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

class Favorite:
    @staticmethod
    def add(user_id, restaurant_id):
        db = get_db()
        cursor = db.cursor(buffered=True)
        try:
            # check if already exists
            cursor.execute("SELECT * FROM favorite WHERE UserID=%s AND RestaurantID=%s", (user_id, restaurant_id))
            if cursor.fetchone():
                cursor.close()
                db.close()
                return False, "Already in favorites"

            cursor.execute(
                "INSERT INTO favorite (UserID, RestaurantID) VALUES (%s,%s)",
                (user_id, restaurant_id)
            )
            db.commit()
            cursor.close()
            db.close()
            return True, "Added to favorites"
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

    @staticmethod
    def remove(user_id, restaurant_id):
        db = get_db()
        cursor = db.cursor(buffered=True)
        try:
            cursor.execute("DELETE FROM favorite WHERE UserID=%s AND RestaurantID=%s", (user_id, restaurant_id))
            db.commit()
            cursor.close()
            db.close()
            return True, "Removed from favorites"
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

    @staticmethod
    def list(user_id):
        db = get_db()
        cursor = db.cursor(buffered=True)
        try:
            cursor.execute("""
                SELECT 
                    r.RestaurantID,
                    r.Name,
                    GROUP_CONCAT(DISTINCT c.CuisineType SEPARATOR ', ') AS Cuisine,
                    a.Area AS Location,
                    rt_summary.AvgRating,
                    rt_summary.RatedBy,
                    a.Latitude,
                    a.Longitude
                FROM restaurant r
                INNER JOIN favorite f ON r.RestaurantID = f.RestaurantID
                LEFT JOIN address a ON r.AddressID = a.AddressID
                LEFT JOIN restaurantcuisine rc ON r.RestaurantID = rc.RestaurantID
                LEFT JOIN cuisine c ON rc.CuisineID = c.CuisineID
                LEFT JOIN (
                    SELECT 
                        RestaurantID,
                        ROUND(AVG(RatingScore), 1) AS AvgRating,
                        COUNT(*) AS RatedBy
                    FROM rating
                    GROUP BY RestaurantID
                ) rt_summary ON r.RestaurantID = rt_summary.RestaurantID
                WHERE f.UserID = %s
                GROUP BY r.RestaurantID, r.Name, a.Area, a.Latitude, a.Longitude
            """, (user_id,))
            rows = cursor.fetchall()
            cursor.close()
            db.close()
            
            favorites = []
            for r in rows:
                rid, name, cuisine, location, avg_rating, rated_by, lat, lon = r
                favorites.append({
                    "RestaurantID": rid,
                    "restaurant_name": name,
                    "cuisine": cuisine or "N/A",
                    "location": location or "N/A",
                    "AvgRating": float(avg_rating) if avg_rating is not None else None,
                    "RatedBy": rated_by if rated_by is not None else 0,
                    "Latitude": float(lat) if lat else None,
                    "Longitude": float(lon) if lon else None
                })
            return favorites
        except Exception as e:
            print(f"Error fetching favorites: {e}")
            try:
                cursor.close()
            except:
                pass
            try:
                db.close()
            except:
                pass
            return []
