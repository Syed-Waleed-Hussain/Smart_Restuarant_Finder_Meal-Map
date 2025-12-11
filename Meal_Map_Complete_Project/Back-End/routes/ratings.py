import sys
import os
from flask import Blueprint, request, jsonify

sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
from models.rating import Rating

ratings_bp = Blueprint("ratings", __name__)


@ratings_bp.route("/add", methods=["POST"])
def add_rating():
 
    data = request.get_json(force=True)
    
    user_id = data.get("UserID")
    restaurant_id = data.get("RestaurantID")
    rating_score = data.get("RatingScore")
    review_text = data.get("Review", "")
    
    # Validate input
    if not user_id or not restaurant_id or not rating_score:
        return jsonify({"error": "UserID, RestaurantID, and RatingScore are required"}), 400
    
    if not isinstance(rating_score, (int, float)) or rating_score < 1 or rating_score > 5:
        return jsonify({"error": "RatingScore must be between 1 and 5"}), 400
    
    if not isinstance(user_id, int) or user_id <= 0:
        return jsonify({"error": "Invalid UserID"}), 400
    
    if not isinstance(restaurant_id, int) or restaurant_id <= 0:
        return jsonify({"error": "Invalid RestaurantID"}), 400
    
    # Add rating (model validates user and restaurant exist)
    success, message = Rating.add_rating(user_id, restaurant_id, rating_score, review_text)
    
    if success:
        return jsonify({"message": message}), 200
    else:
        return jsonify({"error": message}), 400


@ratings_bp.route("/restaurant/<int:restaurant_id>", methods=["GET"])
def get_restaurant_ratings(restaurant_id):
    """
    Get all ratings and reviews for a restaurant
    """
    ratings = Rating.get_restaurant_ratings(restaurant_id)
    return jsonify(ratings), 200


@ratings_bp.route("/user/<int:user_id>/restaurant/<int:restaurant_id>", methods=["GET"])
def get_user_rating(user_id, restaurant_id):
    """
    Get a specific user's rating for a restaurant
    """
    rating = Rating.get_user_rating(user_id, restaurant_id)
    
    if rating:
        return jsonify(rating), 200
    else:
        return jsonify({"message": "No rating found"}), 404
