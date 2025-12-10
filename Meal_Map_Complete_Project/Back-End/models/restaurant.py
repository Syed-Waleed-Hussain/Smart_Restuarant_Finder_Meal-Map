# backend/models/restaurant.py

import sys
import os
from decimal import Decimal

# Add project root to sys.path for imports
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from config import get_db
from utils.map import haversine_distance


class Restaurant:

    def __init__(self,
                 RestaurantID=None,
                 Name=None,
                 Description=None,
                 Cuisine=None,
                 Location=None,
                 Rating=None,
                 Latitude=None,
                 Longitude=None,
                 OwnerID=None):
        self.RestaurantID = RestaurantID
        self.Name = Name
        self.Description = Description
        self.Cuisine = Cuisine
        self.Location = Location
        self.Rating = Rating
        self.Latitude = Latitude
        self.Longitude = Longitude
        self.OwnerID = OwnerID

    # ----------------------------------------------------
    # Add a new restaurant
    # ----------------------------------------------------
    def add_restaurant(self):
        try:
            conn = get_db()
            cursor = conn.cursor(buffered=True)
            sql = """
                INSERT INTO restaurant (Name, AddressID)
                VALUES (%s, %s)
            """
            val = (self.Name, self.Location)  # Location = AddressID
            cursor.execute(sql, val)
            conn.commit()
            cursor.close()
            conn.close()
            print(f"Restaurant '{self.Name}' added successfully!")
        except Exception as e:
            try:
                cursor.close()
            except:
                pass
            try:
                conn.close()
            except:
                pass
            print("Error adding restaurant:", e)

    # ----------------------------------------------------
    # Get all restaurants (with cuisines & avg rating)
    # ----------------------------------------------------
    @staticmethod
    def get_all_restaurants(min_price=None, max_price=None):
        try:
            conn = get_db()
            cursor = conn.cursor(buffered=True)
            sql = """
                SELECT 
                    r.RestaurantID,
                    r.Name,
                    r.minPrice,
                    r.maxPrice,
                    GROUP_CONCAT(DISTINCT c.CuisineType SEPARATOR ', ') AS Cuisine,
                    a.Area AS Location,
                    rt_summary.AvgRating,
                    rt_summary.RatedBy,
                    a.Latitude,
                    a.Longitude,
                    MAX(p.Discount) AS ActiveDiscount,
                    MAX(p.ValidFrom) AS PromotionValidFrom,
                    MAX(p.ValidTo) AS PromotionValidTo
                FROM restaurant r
                LEFT JOIN address a ON r.AddressID = a.AddressID
                LEFT JOIN restaurantcuisine rc ON r.RestaurantID = rc.RestaurantID
                LEFT JOIN cuisine c ON rc.CuisineID = c.CuisineID
                LEFT JOIN promotion p ON r.RestaurantID = p.RestaurantID 
                    AND p.IsActive = 1 
                    AND p.ValidFrom <= NOW() 
                    AND p.ValidTo >= NOW()

                LEFT JOIN (
                    SELECT 
                        RestaurantID,
                        ROUND(AVG(RatingScore), 1) AS AvgRating,
                        COUNT(*) AS RatedBy
                    FROM rating
                    GROUP BY RestaurantID
                ) rt_summary ON r.RestaurantID = rt_summary.RestaurantID
                GROUP BY r.RestaurantID, r.Name, a.Area, a.Latitude, a.Longitude
                Order BY rt_summary.AvgRating DESC, rt_summary.RatedBy DESC
            """
            cursor.execute(sql)
            rows = cursor.fetchall()
            cursor.close()
            conn.close()

            restaurants = []
            for r in rows:
                rid, name, minPrice,maxPrice, cuisine, loc, rating, RatedBy, lat, lon, discount, valid_from, valid_to = r
                restaurants.append({
                    "RestaurantID":
                    rid,
                    "Name":
                    name,
                    "minPrice":
                    minPrice,
                    "maxPrice":
                    maxPrice,
                    "Cuisine":
                    cuisine or "N/A",
                    "Location":
                    loc or "N/A",
                    "Rating":
                    float(rating) if rating is not None else None,
                    "RatedBy":
                    RatedBy if RatedBy is not None else 0,
                    "Latitude":
                    float(lat) if lat else None,
                    "Longitude":
                    float(lon) if lon else None,
                    "ActiveDiscount":
                    float(discount) if discount is not None else None,
                    "PromotionValidFrom":
                    valid_from.strftime('%m/%d') if valid_from else None,
                    "PromotionValidTo":
                    valid_to.strftime('%m/%d') if valid_to else None
                })
            return restaurants

        except Exception as e:
            try:
                cursor.close()
            except:
                pass
            try:
                conn.close()
            except:
                pass
            print("Error fetching restaurants:", e)
            return []

    # ----------------------------------------------------
    # Get a single restaurant by ID
    # ----------------------------------------------------
    @staticmethod
    def get_restaurant_by_id(restaurant_id):
        try:
            conn = get_db()
            cursor = conn.cursor(buffered=True)
            sql = """
                SELECT 
                    r.RestaurantID,
                    r.Name,
                    GROUP_CONCAT(DISTINCT c.CuisineType SEPARATOR ', ') AS Cuisine,
                    a.Area AS Location,
                    a.StreetAddress,
                    a.City,
                    a.Latitude,
                    a.Longitude,

                    rt_summary.AvgRating,
                    rt_summary.RatedBy,
                    MAX(p.Discount) AS ActiveDiscount,
                    MAX(p.ValidFrom) AS PromotionValidFrom,
                    MAX(p.ValidTo) AS PromotionValidTo

                FROM restaurant r
                LEFT JOIN address a ON r.AddressID = a.AddressID
                LEFT JOIN restaurantcuisine rc ON r.RestaurantID = rc.RestaurantID
                LEFT JOIN cuisine c ON rc.CuisineID = c.CuisineID
                LEFT JOIN promotion p ON r.RestaurantID = p.RestaurantID 
                    AND p.IsActive = 1 
                    AND p.ValidFrom <= NOW() 
                    AND p.ValidTo >= NOW()

                LEFT JOIN (
                    SELECT 
                        RestaurantID,
                        ROUND(AVG(RatingScore), 1) AS AvgRating,
                        COUNT(*) AS RatedBy
                    FROM rating
                    GROUP BY RestaurantID
                ) rt_summary ON r.RestaurantID = rt_summary.RestaurantID

                WHERE r.RestaurantID = %s
                GROUP BY r.RestaurantID, r.Name, a.Area, a.StreetAddress, a.City, a.Latitude, a.Longitude
            """
            cursor.execute(sql, (restaurant_id, ))
            row = cursor.fetchone()
            cursor.close()
            conn.close()

            if row:
                rid, name, cuisine, area, street, city, lat, lon, rating, rated_by, discount, valid_from, valid_to = row
                return {
                    "RestaurantID": rid,
                    "Name": name,
                    "Cuisine": cuisine or "N/A",
                    "Location": area or "N/A",
                    "StreetAddress": street or "N/A",
                    "City": city or "N/A",
                    "Latitude": float(lat) if lat else None,
                    "Longitude": float(lon) if lon else None,
                    "Rating": float(rating) if rating is not None else None,
                    "RatedBy": rated_by if rated_by is not None else 0,
                    "ActiveDiscount": float(discount) if discount is not None else None,
                    "PromotionValidFrom": valid_from.strftime('%m/%d') if valid_from else None,
                    "PromotionValidTo": valid_to.strftime('%m/%d') if valid_to else None
                }
            return None

        except Exception as e:
            try:
                cursor.close()
            except:
                pass
            try:
                conn.close()
            except:
                pass
            print("Error fetching restaurant by ID:", e)
            return None

    # ----------------------------------------------------
    # Get restaurants owned by a specific user
    # ----------------------------------------------------
    @staticmethod
    def get_restaurants_by_owner(owner_id):
        try:
            conn = get_db()
            cursor = conn.cursor(buffered=True)
            sql = """
                SELECT 
                    r.RestaurantID,
                    r.Name,
                    r.OwnerID,
                    GROUP_CONCAT(DISTINCT c.CuisineType SEPARATOR ', ') AS Cuisine,
                    a.Area AS Location,
                    a.StreetAddress,
                    a.City,
                    a.Latitude,
                    a.Longitude,
                    rt_summary.AvgRating,
                    rt_summary.RatedBy
                FROM restaurant r
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
                WHERE r.OwnerID = %s
                GROUP BY r.RestaurantID, r.Name, r.OwnerID, a.Area, a.StreetAddress, a.City, a.Latitude, a.Longitude
            """
            cursor.execute(sql, (owner_id,))
            rows = cursor.fetchall()
            cursor.close()
            conn.close()

            restaurants = []
            for r in rows:
                rid, name, owner_id, cuisine, area, street, city, lat, lon, rating, rated_by = r
                restaurants.append({
                    "RestaurantID": rid,
                    "Name": name,
                    "OwnerID": owner_id,
                    "Cuisine": cuisine or "N/A",
                    "Location": area or "N/A",
                    "StreetAddress": street or "N/A",
                    "City": city or "N/A",
                    "Latitude": float(lat) if lat else None,
                    "Longitude": float(lon) if lon else None,
                    "Rating": float(rating) if rating is not None else None,
                    "RatedBy": rated_by if rated_by is not None else 0
                })
            return restaurants

        except Exception as e:
            try:
                cursor.close()
            except:
                pass
            try:
                conn.close()
            except:
                pass
            print("Error fetching restaurants by owner:", e)
            return []

    # ----------------------------------------------------
    # Update restaurant information (owner only)
    # ----------------------------------------------------
    @staticmethod
    def update_restaurant(restaurant_id, **kwargs):
        try:
            allowed_fields = ['Name', 'Description']
            updates = []
            values = []
            
            for field, value in kwargs.items():
                if field in allowed_fields and value is not None:
                    updates.append(f"{field} = %s")
                    values.append(value)
            
            if not updates:
                return False, "No valid fields to update"
            
            values.append(restaurant_id)
            conn = get_db()
            cursor = conn.cursor(buffered=True)
            sql = f"UPDATE restaurant SET {', '.join(updates)} WHERE RestaurantID = %s"
            cursor.execute(sql, tuple(values))
            conn.commit()
            affected = cursor.rowcount
            cursor.close()
            conn.close()
            
            if affected > 0:
                return True, "Restaurant updated successfully"
            return False, "Restaurant not found"
            
        except Exception as e:
            print("Error updating restaurant:", e)
            return False, str(e)

    # ----------------------------------------------------
    # Verify restaurant ownership
    # ----------------------------------------------------
    @staticmethod
    def verify_ownership(restaurant_id, owner_id):
        try:
            conn = get_db()
            cursor = conn.cursor(buffered=True)
            cursor.execute("SELECT OwnerID FROM restaurant WHERE RestaurantID = %s", (restaurant_id,))
            result = cursor.fetchone()
            cursor.close()
            conn.close()
            if not result:
                return False
            print("Owner Id= ",result[0])
            return result[0] == owner_id
            
        except Exception as e:
            print("Error verifying ownership:", e)
            return False

    # ----------------------------------------------------
    # Get restaurants with distance from user
    # ----------------------------------------------------
    @staticmethod
    def get_all_with_distance(user_lat, user_lon):
        try:
            conn = get_db()
            cursor = conn.cursor(buffered=True)
            sql = """
                SELECT 
                    r.RestaurantID,
                    r.Name,
                    a.Area AS Location,
                    a.Latitude,
                    a.Longitude,

                    GROUP_CONCAT(DISTINCT c.CuisineType SEPARATOR ', ') AS Cuisine,

                    rt_summary.AvgRating,
                    rt_summary.RatedBy

                FROM restaurant r
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

                GROUP BY r.RestaurantID, r.Name, a.Area, a.Latitude, a.Longitude
            """
            cursor.execute(sql)
            rows = cursor.fetchall()
            cursor.close()
            conn.close()

            restaurants = []
            for r in rows:
                rid, name, loc, lat, lon, cuisine, rating, RatedBy = r

                dist = None
                if lat and lon:
                    dist = haversine_distance(float(user_lat), float(user_lon),
                                              float(lat), float(lon))

                restaurants.append({
                    "RestaurantID":
                    rid,
                    "Name":
                    name,
                    "Cuisine":
                    cuisine or "N/A",
                    "Location":
                    loc or "N/A",
                    "Rating":
                    float(rating) if rating is not None else None,
                    "RatedBy":
                    RatedBy if RatedBy is not None else 0,
                    "Latitude":
                    float(lat) if lat else None,
                    "Longitude":
                    float(lon) if lon else None,
                    "Distance_km":
                    round(dist, 2) if dist else None
                })
            return restaurants

        except Exception as e:
            try:
                cursor.close()
            except:
                pass
            try:
                conn.close()
            except:
                pass
            print("Error fetching restaurants with distance:", e)
            return []


# ----------------------------------------------------
# TEST (only runs if executed directly)
# ----------------------------------------------------
if __name__ == "__main__":
    print("Fetching all restaurants...")
    all_restaurants = Restaurant.get_all_restaurants()
    

    user_lat, user_lon = 24.8607, 67.0011
    restaurants_with_distance = Restaurant.get_all_with_distance(
        user_lat, user_lon)
    print("Restaurants with distance from user:")
    for r in restaurants_with_distance:
        print(r)
