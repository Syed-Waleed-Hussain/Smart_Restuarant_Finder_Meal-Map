# backend/models/recommender.py

import sys
import os

sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
from config import get_db

class Recommender:
    @staticmethod
    def _get_cuisine_ids(cuisine_names):
        """
        Given list of cuisine names (strings), return list of CuisineID ints.
        If cuisine_names is empty or None, returns [].
        """
        if not cuisine_names:
            return []

        conn = get_db()
        cursor = conn.cursor(buffered=True)
        placeholders = ",".join(["%s"] * len(cuisine_names))
        sql = f"SELECT CuisineID FROM cuisine WHERE CuisineType IN ({placeholders})"
        cursor.execute(sql, tuple(cuisine_names))
        rows = cursor.fetchall()
        cursor.close()
        conn.close()
        return [r[0] for r in rows]

    @staticmethod
    def recommend(cuisines=None, min_price=None, min_rating=None,
                  location=None, sort_by="rating", limit=30):
        """
        KB recommender:
        - cuisines: list of cuisine strings
        - min_price: minimum price
        - min_rating: minimum rating
        - location: filter Area (LOCATION FILTER ADDED)
        - sort_by: rating | price_asc | price_desc | totalratings
        """

        cuisine_ids = Recommender._get_cuisine_ids(cuisines or [])

        sql = """
        SELECT
            r.RestaurantID,
            r.Name,
            r.minPrice,
            r.maxPrice,
            rt_summary.AvgRating,
            rt_summary.RatedBy as TotalRatings,
            a.Area AS Area,
            GROUP_CONCAT(DISTINCT c.CuisineType SEPARATOR ', ') AS Cuisines
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
        WHERE r.IsActive = 1
        """

        params = []

        # Cuisine filters
        if cuisine_ids:
            placeholders = ",".join(["%s"] * len(cuisine_ids))
            sql += f" AND rc.CuisineID IN ({placeholders})"
            params.extend(cuisine_ids)

        # Price filter
        if min_price is not None:
            sql += " AND r.minPrice >= %s"
            params.append(min_price)

        # Rating filter
        if min_rating is not None:
            sql += " AND r.AvgRating >= %s"
            params.append(min_rating)

        # LOCATION FILTER
      # LOCATION FILTER (partial match)
        if location:
          sql += " AND a.Area LIKE %s"
          params.append(f"%{location}%")  # adds wildcard before and after


        sql += " GROUP BY r.RestaurantID, r.Name, r.PriceRange, rt.RatingScore, a.Area"

        # Sorting
        if sort_by == "rating":
            sql += " ORDER BY AvgRating DESC, TotalRatings DESC"
        elif sort_by == "price_asc":
            sql += " ORDER BY r.minPrice ASC"
        elif sort_by == "price_desc":
            sql += " ORDER BY r.maxPrice DESC"
        elif sort_by == "totalratings":
            sql += " ORDER BY TotalRatings DESC"
        else:
            sql += " ORDER BY AvgRating DESC"

        sql += " LIMIT %s"
        params.append(limit)
        
        conn = get_db()
        cursor = conn.cursor(buffered=True)
        cursor.execute(sql, tuple(params))
        records = cursor.fetchall()
        cursor.close()
        conn.close()

        results = []
        print('records: ', records)
        for row in records:
            rid, name, price, avg, total, area, cuisines_str = row

            results.append({
                "RestaurantID": rid,
                "Name": name,
                "PriceRange": float(price) if price is not None else None,
                "AvgRating": float(avg),
                "TotalRatings": int(total),
                "Area": area,
                "Cuisines": cuisines_str or ""
            })

        return results
