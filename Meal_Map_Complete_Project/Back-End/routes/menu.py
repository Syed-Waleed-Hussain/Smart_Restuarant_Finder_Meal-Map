from flask import Blueprint, jsonify
import sys, os

sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
from models.menu import Menu

menu_bp = Blueprint("menu", __name__)

# -------------------------------
# GET MENU OF A RESTAURANT
# -------------------------------
@menu_bp.route("/<int:res_id>", methods=["GET"])
def get_menu(res_id):
    data = Menu.get_menu_by_restaurant(res_id)
    if not data:
        return jsonify({"message": "No menu found"}), 404
    return jsonify(data), 200


# -------------------------------
# GET SINGLE MENU ITEM
# -------------------------------
@menu_bp.route("/item/<int:item_id>", methods=["GET"])
def get_item(item_id):
    row = Menu.get_single_item(item_id)
    if not row:
        return jsonify({"message": "Menu item not found"}), 404
    return jsonify(row), 200
