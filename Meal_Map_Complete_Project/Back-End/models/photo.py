# backend/models/photo.py

import sys
import os
from config import get_db

sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

class Photo:
    @staticmethod
    def add(restaurant_id, photo_url, description=None):
        db = get_db()
        cursor = db.cursor(buffered=True)
        try:
            cursor.execute(
                "INSERT INTO photo (RestaurantID, PhotoURL, Description) VALUES (%s, %s, %s)",
                (restaurant_id, photo_url, description)
            )
            db.commit()
            cursor.close()
            db.close()
            return True, "Photo added"
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
    def list_for_restaurant(restaurant_id):
        db = get_db()
        cursor = db.cursor(buffered=True)
        try:
            cursor.execute(
                "SELECT PhotoID, PhotoURL, Description, CreatedAt FROM photo WHERE RestaurantID=%s ORDER BY CreatedAt DESC",
                (restaurant_id,)
            )
            rows = cursor.fetchall()
            cursor.close()
            db.close()
            keys = ["PhotoID", "PhotoURL", "Description", "CreatedAt"]
            return [dict(zip(keys, r)) for r in rows]
        except Exception as e:
            try:
                cursor.close()
            except:
                pass
            try:
                db.close()
            except:
                pass
            return []

    @staticmethod
    def remove(photo_id):
        db = get_db()
        cursor = db.cursor(buffered=True)
        try:
            cursor.execute("DELETE FROM photo WHERE PhotoID=%s", (photo_id,))
            db.commit()
            cursor.close()
            db.close()
            return True, "Photo removed"
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
