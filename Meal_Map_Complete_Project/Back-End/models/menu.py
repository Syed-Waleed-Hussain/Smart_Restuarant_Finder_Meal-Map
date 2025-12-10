import sys
import os
from config import get_db

sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

class Menu:
    @staticmethod
    def get_menu_by_restaurant(res_id):
        db = get_db()
        cursor = db.cursor(dictionary=True)
        sql = """
            SELECT m.MenuID, m.RestaurantID, m.Name,
                   mi.MenuItemID, mi.Name as ItemName, mi.Description, 
                   mi.image,mi.Price, mi.IsAvailable
            FROM menu m
            LEFT JOIN menuitem mi ON m.MenuID = mi.MenuID
            WHERE m.RestaurantID = %s
        """
        cursor.execute(sql, (res_id,))
        rows = cursor.fetchall()
        cursor.close()
        db.close()
        return rows

    @staticmethod
    def get_single_item(item_id):
        db = get_db()
        cursor = db.cursor(dictionary=True)
        sql = "SELECT * FROM menuitem WHERE MenuItemID = %s"
        cursor.execute(sql, (item_id,))
        row = cursor.fetchone()
        cursor.close()
        db.close()
        return row

    @staticmethod
    def add_menu_item(menu_id, name, description, price, image=None, is_available=True):
        try:
            db = get_db()
            cursor = db.cursor(buffered=True)
            sql = """
                INSERT INTO menuitem (MenuID, Name, Description, Price, image, IsAvailable)
                VALUES (%s, %s, %s, %s, %s, %s)
            """
            cursor.execute(sql, (menu_id, name, description, price, image, is_available))
            db.commit()
            item_id = cursor.lastrowid
            cursor.close()
            db.close()
            return True, item_id
        except Exception as e:
            print("Error adding menu item:", e)
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
    def update_menu_item(item_id, **kwargs):
        try:
            db = get_db()
            allowed_fields = ['Name', 'Description', 'Price', 'image', 'IsAvailable']
            updates = []
            values = []
            
            for field, value in kwargs.items():
                if field in allowed_fields and value is not None:
                    updates.append(f"{field} = %s")
                    values.append(value)
            
            if not updates:
                return False, "No valid fields to update"
            
            values.append(item_id)
            cursor = db.cursor(buffered=True)
            sql = f"UPDATE menuitem SET {', '.join(updates)} WHERE MenuItemID = %s"
            cursor.execute(sql, tuple(values))
            db.commit()
            affected = cursor.rowcount
            cursor.close()
            db.close()
            
            if affected > 0:
                return True, "Menu item updated successfully"
            return False, "Menu item not found"
            
        except Exception as e:
            print("Error updating menu item:", e)
            return False, str(e)

    @staticmethod
    def delete_menu_item(item_id):
        try:
            db = get_db()
            cursor = db.cursor(buffered=True)
            cursor.execute("DELETE FROM menuitem WHERE MenuItemID = %s", (item_id,))
            db.commit()
            affected = cursor.rowcount
            cursor.close()
            db.close()
            return affected > 0
        except Exception as e:
            print("Error deleting menu item:", e)
            return False

    @staticmethod
    def toggle_availability(item_id, is_available):
        try:
            db = get_db()
            cursor = db.cursor(buffered=True)
            cursor.execute("UPDATE menuitem SET IsAvailable = %s WHERE MenuItemID = %s", (is_available, item_id))
            db.commit()
            affected = cursor.rowcount
            cursor.close()
            db.close()
            return affected > 0
        except Exception as e:
            print("Error toggling menu item availability:", e)
            return False

    @staticmethod
    def get_menu_id_for_restaurant(restaurant_id):
        db = get_db()
        cursor = db.cursor(buffered=True)
        cursor.execute("SELECT MenuID FROM menu WHERE RestaurantID = %s LIMIT 1", (restaurant_id,))
        result = cursor.fetchone()
        cursor.close()
        db.close()
        return result[0] if result else None
