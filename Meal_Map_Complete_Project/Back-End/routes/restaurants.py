# backend/routes/restaurants.py

import sys
import os
from flask import Blueprint, jsonify, request
import urllib.parse

# -------------------------
# Add project root to sys.path
# -------------------------
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from models.restaurant import Restaurant

# -------------------------
# Blueprint
# -------------------------
restaurants_bp = Blueprint('restaurants', __name__)

# -------------------------
# Recommend restaurants route
# -------------------------
@restaurants_bp.route("/recommend", methods=["GET"])
def recommend_restaurants():
    """
    Endpoint: /recommend?user_lat=24.86&user_lon=67.0
    - user_lat, user_lon: optional user location to sort by distance
    """
    # Get query params
    user_lat = request.args.get("user_lat", type=float)
    user_lon = request.args.get("user_lon", type=float)

    # Fetch all restaurants
    if user_lat is not None and user_lon is not None:
        all_restaurants = Restaurant.get_all_with_distance(user_lat, user_lon)
    else:
        all_restaurants = Restaurant.get_all_restaurants()
        # Add None distance for consistency
        for r in all_restaurants:
            r["Distance_km"] = None

    
    # Sort: first by distance if available, else by rating descending
    def sort_key(r):
        if r["Distance_km"] is not None:
            return (r["Distance_km"], -r["Rating"] if r["Rating"] else 0)
        else:
            return -(r["Rating"] if r["Rating"] else 0)

    sorted_restaurants = sorted(all_restaurants, key=sort_key)

    # Add Google Maps URL
    for r in sorted_restaurants:
        lat = r.get("Latitude")
        lon = r.get("Longitude")
        loc = r.get("Location")

        if lat and lon:
            maps_url = f"https://www.google.com/maps/search/?api=1&query={lat},{lon}"
        else:
            encoded_address = urllib.parse.quote_plus(str(loc))
            maps_url = f"https://www.google.com/maps/search/?api=1&query={encoded_address}"

        r["MapsURL"] = maps_url

    return jsonify(sorted_restaurants)

# -------------------------
# Search restaurants route
# -------------------------
@restaurants_bp.route("/search", methods=["GET"])
def search_restaurants():
    """
    Endpoint: /search?q=pizza
    - q: search query for restaurant name, cuisine, or location
    """
    query = (request.args.get("q", "") or "").lower()
    min_price = request.args.get("min_price", type=float)
    max_price = request.args.get("max_price", type=float)
    print(f"[SEARCH] query='{query}', min_price={min_price}, max_price={max_price}")
    if not query:
        # Return all restaurants if no query
        all_restaurants = Restaurant.get_all_restaurants()
    else:
        # Get all and filter
        all_restaurants = Restaurant.get_all_restaurants()
        filtered = []
        for r in all_restaurants:
            name = (r.get("Name") or "").lower()
            cuisine = (r.get("Cuisine") or "").lower()
            location = (r.get("Location") or "").lower()
            
            if query in name or query in cuisine or query in location:
                filtered.append(r)
        
        all_restaurants = filtered

    # Apply price range filter if provided
    if min_price is not None or max_price is not None:
        pr_filtered = []
        for r in all_restaurants:
            min = r.get("minPrice")
            max=r.get("maxPrice")
            # If restaurant has no PriceRange info, skip it when filtering by price
            if min is None and max is None:
                continue
            try:
                minPrice_val = float(min)
                maxPrice_val = float(max)
            except Exception:
                continue
            if min_price is not None and minPrice_val < min_price:
                continue
            if max_price is not None and maxPrice_val > max_price:
                continue
            pr_filtered.append(r)
        all_restaurants = pr_filtered
     
    
    # Add Google Maps URL
    for r in all_restaurants:
        lat = r.get("Latitude")
        lon = r.get("Longitude")
        loc = r.get("Location")
        
        if lat and lon:
            maps_url = f"https://www.google.com/maps/search/?api=1&query={lat},{lon}"
        else:
            encoded_address = urllib.parse.quote_plus(str(loc))
            maps_url = f"https://www.google.com/maps/search/?api=1&query={encoded_address}"
        
        r["MapsURL"] = maps_url
    
    return jsonify(all_restaurants)

# -------------------------
# Get restaurant by ID route
# -------------------------
@restaurants_bp.route("/<int:restaurant_id>", methods=["GET"])
def get_restaurant(restaurant_id):
    """
    Endpoint: /restaurants/<id>
    """
    restaurant = Restaurant.get_restaurant_by_id(restaurant_id)
    if restaurant:
        return jsonify(restaurant)
    else:
        return jsonify({"error": "Restaurant not found"}), 404
