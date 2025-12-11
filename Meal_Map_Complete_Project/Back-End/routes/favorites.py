# backend/routes/favorites.py

import sys
import os
from flask import Blueprint, request, jsonify

sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
from models.favorite import Favorite

favorites_bp = Blueprint("favorites", __name__)

# Add to favorites
@favorites_bp.route("/add", methods=["POST"])
def add_favorite():
    data = request.get_json(force=True)
    user_id = data.get("UserID")
    restaurant_id = data.get("RestaurantID")
    print(f"Add favorite request - UserID: {user_id}, RestaurantID: {restaurant_id}, Data: {data}")
    if not user_id or not restaurant_id:
        return jsonify({"error":"UserID and RestaurantID required"}),400
    ok,msg = Favorite.add(user_id, restaurant_id)
    if ok:
        return jsonify({"message":msg}),200
    return jsonify({"error":msg}),400

# Remove from favorites
@favorites_bp.route("/remove", methods=["POST"])
def remove_favorite():
    data = request.get_json(force=True)
    user_id = data.get("UserID")
    restaurant_id = data.get("RestaurantID")
    if not user_id or not restaurant_id:
        return jsonify({"error":"UserID and RestaurantID required"}),400
    ok,msg = Favorite.remove(user_id, restaurant_id)
    if ok:
        return jsonify({"message":msg}),200
    return jsonify({"error":msg}),400

# List favorites
@favorites_bp.route("/user/<int:user_id>", methods=["GET"])
def list_favorites(user_id):
    rows = Favorite.list(user_id)
    return jsonify(rows),200
