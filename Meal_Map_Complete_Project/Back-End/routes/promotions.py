# backend/routes/promotions.py

import sys
import os
from flask import Blueprint, request, jsonify

sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
from models.promotion import Promotion

promotions_bp = Blueprint("promotions", __name__)

# Get all active promotions
@promotions_bp.route("/active", methods=["GET"])
def get_active_promotions():
    """
    Get all currently active promotions across all restaurants
    """
    rows = Promotion.get_all_active()
    return jsonify(rows), 200

# List promotions per restaurant
@promotions_bp.route("/restaurant/<int:restaurant_id>", methods=["GET"])
def list_promotions(restaurant_id):
    rows = Promotion.get_for_restaurant(restaurant_id)
    return jsonify(rows), 200

# Create promotion
@promotions_bp.route("/create", methods=["POST"])
def create_promotion():
    data = request.get_json(force=True)
    required = ["RestaurantID","Title","Discount","ValidFrom","ValidTo"]
    for r in required:
        if r not in data:
            return jsonify({"error": f"{r} is required"}), 400
    p = Promotion(
        RestaurantID=data["RestaurantID"],
        Title=data["Title"],
        Description=data.get("Description"),
        Discount=data["Discount"],
        ValidFrom=data["ValidFrom"],
        ValidTo=data["ValidTo"]
    )
    ok,msg = p.create()
    if ok:
        return jsonify({"message":"Promotion created","PromotionID":msg}),201
    return jsonify({"error":msg}),500

# Update promotion
@promotions_bp.route("/update/<int:promotion_id>", methods=["PUT"])
def update_promotion(promotion_id):
    data = request.get_json(force=True)
    ok,msg = Promotion.update(promotion_id, **data)
    if ok:
        return jsonify({"message":msg}),200
    return jsonify({"error":msg}),500

# Delete promotion
@promotions_bp.route("/delete/<int:promotion_id>", methods=["DELETE"])
def delete_promotion(promotion_id):
    ok,msg = Promotion.delete(promotion_id)
    if ok:
        return jsonify({"message":"Promotion deleted"}),200
    return jsonify({"error":msg}),500
