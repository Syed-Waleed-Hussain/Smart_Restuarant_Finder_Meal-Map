# backend/routes/reservations.py

import sys
import os
from flask import Blueprint, request, jsonify

sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
from models.reservation import Reservation

reservations_bp = Blueprint("reservations", __name__)

# ------------------- CREATE RESERVATION -------------------
@reservations_bp.route("/create", methods=["POST"])
def create_reservation():
    """
    JSON Input:
    {
        "RestaurantID": int,
        "UserID": int,
        "GuestCount": int,          # optional, default=1
        "ReservationTime": "YYYY-MM-DD HH:MM:SS",
        "TableID": int,             
        "Notes": "optional text"
    }
    """
    data = request.get_json(force=True)
    
    # Required fields
    for field in ["RestaurantID", "UserID", "ReservationTime"]:
        if field not in data:
            return jsonify({"error": f"{field} is required"}), 400

    # Build Reservation object
    res = Reservation(
        RestaurantID=data["RestaurantID"],
        UserID=data["UserID"],
        TableID=data.get("TableID"),  # optional
        GuestCount=data.get("GuestCount", 1),
        ReservationTime=data["ReservationTime"],
        Notes=data.get("Notes")
    )

    ok, result = res.add_reservation()
    if not ok:
        return jsonify({"error": result}), 400

    return jsonify({"message": "Reservation Created Successfully", "reservation": result}), 201

# ------------------- GET RESERVATIONS FOR USER -------------------
@reservations_bp.route("/user/<int:user_id>", methods=["GET"])
def reservations_for_user(user_id):
    reservations = Reservation.get_for_user(user_id)
    
    return jsonify(reservations), 200

# ------------------- CANCEL RESERVATION -------------------
@reservations_bp.route("/cancel/<int:reservation_id>", methods=["POST"])
def cancel_reservation(reservation_id):
    if Reservation.cancel_reservation(reservation_id):
        return jsonify({"message": "Reservation Cancelled Successfully"}), 200
    return jsonify({"error": "Failed to cancel reservation"}), 500

# ------------------- LIST TABLES FOR RESTAURANT -------------------
@reservations_bp.route("/restaurant/<int:restaurant_id>/tables", methods=["GET"])
def list_tables(restaurant_id):
    tables = Reservation.get_tables_for_restaurant(restaurant_id)
    return jsonify(tables), 200
