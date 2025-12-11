# backend/routes/recommend.py

import sys
import os
from flask import Blueprint, request, jsonify

sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
from models.recommender import Recommender

recommend_bp = Blueprint("recommend", __name__)

@recommend_bp.route("/", methods=["POST"])
def recommend():
    """
    JSON Body Example:
    {
      "Cuisines": ["BBQ","Pakistani"],
      "MinPrice": 500,
      "MinRating": 4,
      "Location": "DHA",
      "SortBy": "rating",
      "Limit": 20
    }
    """

    data = request.get_json(force=True, silent=True) or {}

    cuisines = data.get("Cuisines")
    min_price = data.get("MinPrice")
    min_rating = data.get("MinRating")
    location = data.get("Location")       
    sort_by = data.get("SortBy", "rating")
    limit = int(data.get("Limit", 30))

    try:
        results = Recommender.recommend(
            cuisines=cuisines,
            min_price=min_price,
            min_rating=min_rating,
            location=location,
            sort_by=sort_by,
            limit=limit,
        )
        return jsonify({"count": len(results), "results": results}), 200

    except Exception as e:
        return jsonify({"error": str(e)}), 500

# Get personalized recommendations for a user
@recommend_bp.route("/<int:user_id>", methods=["GET"])
def get_user_recommendations(user_id):
  
    try:
        # For now, return general recommendations
        # TODO: Implement actual personalization based on user history
        results = Recommender.recommend(
            cuisines=None,
            min_price=None,
            min_rating=4.0,  
            location=None,
            sort_by="rating",
            limit=10,
        )
        return jsonify({"user_id": user_id, "recommendations": results}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500
