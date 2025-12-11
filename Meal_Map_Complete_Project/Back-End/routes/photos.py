# backend/routes/photos.py

import sys
import os
from flask import Blueprint, request, jsonify

sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
from models.photo import Photo

photos_bp = Blueprint("photos", __name__)

# Add photo
@photos_bp.route("/add", methods=["POST"])
def add_photo():
    data = request.get_json(force=True)
    restaurant_id = data.get("RestaurantID")
    photo_url = data.get("PhotoURL")
    description = data.get("Description")
    if not restaurant_id or not photo_url:
        return jsonify({"error":"RestaurantID and PhotoURL required"}),400
    ok,msg = Photo.add(restaurant_id, photo_url, description)
    if ok:
        return jsonify({"message":msg}),200
    return jsonify({"error":msg}),400

# List photos for restaurant
@photos_bp.route("/restaurant/<int:restaurant_id>", methods=["GET"])
def list_photos(restaurant_id):
    rows = Photo.list_for_restaurant(restaurant_id)
    return jsonify(rows),200

# Remove photo
@photos_bp.route("/remove/<int:photo_id>", methods=["DELETE"])
def remove_photo(photo_id):
    ok,msg = Photo.remove(photo_id)
    if ok:
        return jsonify({"message":msg}),200
    return jsonify({"error":msg}),400
