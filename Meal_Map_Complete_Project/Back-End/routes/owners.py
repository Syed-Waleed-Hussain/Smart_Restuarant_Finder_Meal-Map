# backend/routes/owners.py

import sys
import os
from flask import Blueprint, request, jsonify
from config import get_db

sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
from models.restaurant import Restaurant
from models.reservation import Reservation
from models.menu import Menu

owners_bp = Blueprint("owners", __name__)

# Get restaurants owned by current user
@owners_bp.route("/restaurants/<int:owner_id>", methods=["GET"])
def get_owner_restaurants(owner_id):
    restaurants = Restaurant.get_restaurants_by_owner(owner_id)
    return jsonify(restaurants), 200

# Update restaurant information
@owners_bp.route("/restaurant/<int:restaurant_id>", methods=["PUT"])
def update_restaurant(restaurant_id):
    data = request.get_json(force=True)
    owner_id = data.get("OwnerID")
    
    if not owner_id:
        return jsonify({"error": "OwnerID is required"}), 400
    
    if not Restaurant.verify_ownership(restaurant_id, owner_id):
        return jsonify({"error": "Unauthorized: You do not own this restaurant"}), 403
    
    ok, msg = Restaurant.update_restaurant(restaurant_id, **data)
    if ok:
        return jsonify({"message": msg}), 200
    return jsonify({"error": msg}), 400

# Get reservations for owner's restaurant
@owners_bp.route("/restaurant/<int:restaurant_id>/reservations", methods=["GET"])
def get_restaurant_reservations(restaurant_id):
    owner_id = request.args.get("owner_id", type=int)
    status_filter = request.args.get("status")
    
    if not owner_id:
        return jsonify({"error": "owner_id query parameter is required"}), 400
    
    if not Restaurant.verify_ownership(restaurant_id, owner_id):
        return jsonify({"error": "Unauthorized: You do not own this restaurant"}), 403
    
    reservations = Reservation.get_for_restaurant(restaurant_id, status_filter)
    return jsonify(reservations), 200

# Confirm reservation
@owners_bp.route("/reservation/<int:reservation_id>/confirm", methods=["POST"])
def confirm_reservation(reservation_id):
    data = request.get_json(force=True)
    owner_id = data.get("OwnerID")
    
    if not owner_id:
        return jsonify({"error": "OwnerID is required"}), 400
    
    reservation = Reservation.get_by_id(reservation_id)
    if not reservation:
        return jsonify({"error": "Reservation not found"}), 404
    
    if not Restaurant.verify_ownership(reservation["RestaurantID"], owner_id):
        return jsonify({"error": "Unauthorized: You do not own this restaurant"}), 403
    
    if Reservation.confirm_reservation(reservation_id):
        return jsonify({"message": "Reservation confirmed successfully"}), 200
    return jsonify({"error": "Failed to confirm reservation"}), 500

# Cancel reservation (owner side)
@owners_bp.route("/reservation/<int:reservation_id>/cancel", methods=["POST"])
def cancel_owner_reservation(reservation_id):
    data = request.get_json(force=True)
    owner_id = data.get("OwnerID")
    
    if not owner_id:
        return jsonify({"error": "OwnerID is required"}), 400
    
    reservation = Reservation.get_by_id(reservation_id)
    if not reservation:
        return jsonify({"error": "Reservation not found"}), 404
    
    if not Restaurant.verify_ownership(reservation["RestaurantID"], owner_id):
        return jsonify({"error": "Unauthorized: You do not own this restaurant"}), 403
    
    if Reservation.cancel_reservation(reservation_id):
        return jsonify({"message": "Reservation cancelled successfully"}), 200
    return jsonify({"error": "Failed to cancel reservation"}), 500

# Add menu item
@owners_bp.route("/restaurant/<int:restaurant_id>/menu/add", methods=["POST"])
def add_menu_item(restaurant_id):
    data = request.get_json(force=True)
    owner_id = data.get("OwnerID")
    
    if not owner_id:
        return jsonify({"error": "OwnerID is required"}), 400
    
    if not Restaurant.verify_ownership(restaurant_id, owner_id):
        return jsonify({"error": "Unauthorized: You do not own this restaurant"}), 403
    
    menu_id = Menu.get_menu_id_for_restaurant(restaurant_id)
    if not menu_id:
        return jsonify({"error": "Menu not found for this restaurant"}), 404
    
    required_fields = ["Name", "Price"]
    for field in required_fields:
        if field not in data:
            return jsonify({"error": f"{field} is required"}), 400
    
    ok, result = Menu.add_menu_item(
        menu_id=menu_id,
        name=data["Name"],
        description=data.get("Description", ""),
        price=data["Price"],
        image=data.get("image"),
        is_available=data.get("IsAvailable", True)
    )
    
    if ok:
        return jsonify({"message": "Menu item added successfully", "MenuItemID": result}), 201
    return jsonify({"error": result}), 400

# Update menu item
@owners_bp.route("/menu/item/<int:item_id>", methods=["PUT"])
def update_menu_item(item_id):
    data = request.get_json(force=True)
    owner_id = data.get("OwnerID")
    
    if not owner_id:
        return jsonify({"error": "OwnerID is required"}), 400
    
    item = Menu.get_single_item(item_id)
    if not item:
        return jsonify({"error": "Menu item not found"}), 404
    
    menu_id = item["MenuID"]
    db = get_db()
    cursor = db.cursor(buffered=True)
    cursor.execute("SELECT RestaurantID FROM menu WHERE MenuID = %s", (menu_id,))
    result = cursor.fetchone()
    cursor.close()
    db.close()
    
    if not result:
        return jsonify({"error": "Restaurant not found"}), 404
    
    restaurant_id = result[0]
    
    if not Restaurant.verify_ownership(restaurant_id, owner_id):
        return jsonify({"error": "Unauthorized: You do not own this restaurant"}), 403
    
    ok, msg = Menu.update_menu_item(item_id, **data)
    if ok:
        return jsonify({"message": msg}), 200
    return jsonify({"error": msg}), 400

# Delete menu item
@owners_bp.route("/menu/item/<int:item_id>", methods=["DELETE"])
def delete_menu_item(item_id):
    owner_id = request.args.get("owner_id", type=int)
    
    if not owner_id:
        return jsonify({"error": "owner_id query parameter is required"}), 400
    
    item = Menu.get_single_item(item_id)
    if not item:
        return jsonify({"error": "Menu item not found"}), 404
    
    menu_id = item["MenuID"]
    db = get_db()
    cursor = db.cursor(buffered=True)
    cursor.execute("SELECT RestaurantID FROM menu WHERE MenuID = %s", (menu_id,))
    result = cursor.fetchone()
    cursor.close()
    db.close()
    
    if not result:
        return jsonify({"error": "Restaurant not found"}), 404
    
    restaurant_id = result[0]
    
    if not Restaurant.verify_ownership(restaurant_id, owner_id):
        return jsonify({"error": "Unauthorized: You do not own this restaurant"}), 403
    
    if Menu.delete_menu_item(item_id):
        return jsonify({"message": "Menu item deleted successfully"}), 200
    return jsonify({"error": "Failed to delete menu item"}), 500

# Toggle menu item availability
@owners_bp.route("/menu/item/<int:item_id>/toggle", methods=["POST"])
def toggle_menu_item(item_id):
    data = request.get_json(force=True)
    owner_id = data.get("OwnerID")
    is_available = data.get("IsAvailable")
    
    if not owner_id:
        return jsonify({"error": "OwnerID is required"}), 400
    
    if is_available is None:
        return jsonify({"error": "IsAvailable is required"}), 400
    
    item = Menu.get_single_item(item_id)
    if not item:
        return jsonify({"error": "Menu item not found"}), 404
    
    menu_id = item["MenuID"]
    db = get_db()
    cursor = db.cursor(buffered=True)
    cursor.execute("SELECT RestaurantID FROM menu WHERE MenuID = %s", (menu_id,))
    result = cursor.fetchone()
    cursor.close()
    db.close()
    
    if not result:
        return jsonify({"error": "Restaurant not found"}), 404
    
    restaurant_id = result[0]
    
    if not Restaurant.verify_ownership(restaurant_id, owner_id):
        return jsonify({"error": "Unauthorized: You do not own this restaurant"}), 403
    
    if Menu.toggle_availability(item_id, is_available):
        return jsonify({"message": "Menu item availability updated successfully"}), 200
    return jsonify({"error": "Failed to update menu item availability"}), 500
