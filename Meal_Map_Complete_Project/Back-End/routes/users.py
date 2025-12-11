import sys
import os
import random
from datetime import datetime, timedelta
from flask import Blueprint, request, jsonify

sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
from models.useraccount import UserAccount
from utils.email import send_otp_email
from config import get_db

users_bp = Blueprint("users", __name__)
otp_storage = {}  # In-memory OTP store


# ------------------------- LOGIN / SIGNUP -------------------------
@users_bp.route("/login", methods=["POST"])
def login_user():
    data = request.get_json(force=True)
    email = (data.get("email") or "").strip().lower()
    password = data.get("password")

    if not email:
        return jsonify({"error": "email is required"}), 400

    user_row = UserAccount.get_by_email(email)
    if user_row:
        if not password:
            return jsonify({"error":
                            "password required for existing user"}), 400
        ok, user = UserAccount.verify_login(email, password)
        if ok:
            zipdata = UserAccount.row_to_dict(user)
            print("User data:", zipdata)
            return jsonify({
                "message": "login successful",
                "user": zipdata
            }), 200
        else:
            return jsonify({"error": "invalid credentials"}), 401

    else:
        return jsonify({"error": "invalid credentials"}), 401


@users_bp.route("/register", methods=["POST"])
def register_user():
    data = request.get_json(force=True)
    email = (data.get("email") or "").strip().lower()
    password = data.get("password")

    if not email:
        return jsonify({"error": "email is required"}), 400

    if not password:
        return jsonify({"error": "password is required"}), 400

    user_row = UserAccount.get_by_email(email)
    if user_row:
        return jsonify({"error": "Email Already Exist"}), 401

    # CREATE USER IN DATABASE (UNVERIFIED)
    user = UserAccount(FirstName=data.get("first_name"),
                       LastName=data.get("last_name"),
                       Email=email,
                       ContactNo=data.get("contact"),
                       Password=password,
                       Role="user")

    success, created_user = user.register_user()
    if not success:
        return jsonify({"error": "Failed to save user"}), 500

    # GENERATE OTP
    otp = random.randint(100000, 999999)
    expires = datetime.utcnow() + timedelta(minutes=5)

    otp_storage[email] = {"otp": otp, "expires": expires}

    try:
        send_otp_email(email, otp)
    except Exception as e:
        print("Email error:", e)

    return jsonify({
        "message": "User created. OTP sent",
        "user": UserAccount.row_to_dict(created_user),
        "otp": otp
    }), 201


# ------------------------- VERIFY OTP -------------------------
@users_bp.route("/verify_otp", methods=["POST"])
def verify_otp():
    db = get_db()
    data = request.get_json(force=True)
    email = (data.get("email") or "").strip().lower()
    otp_input = data.get("otp")
    print(f"[OTP VERIFY] Request data: {data}")

    if not email or not otp_input:
        print(f"[OTP VERIFY] Missing email or OTP")
        return jsonify({"error": "email and otp required"}), 400

    record = otp_storage.get(email)
    if not record:
        print(
            f"[OTP VERIFY] No OTP found for {email}. Current storage: {list(otp_storage.keys())}"
        )
        return jsonify({"error": "no OTP requested for this email"}), 400

    print(
        f"[OTP VERIFY] Found record for {email}: OTP={record['otp']}, Expires={record['expires']}"
    )

    if datetime.utcnow() > record["expires"]:
        print(f"[OTP VERIFY] OTP expired for {email}")
        otp_storage.pop(email, None)
        return jsonify({"error": "otp expired"}), 400

    # Convert OTP input to int for comparison
    try:
        otp_int = int(otp_input)
    except (ValueError, TypeError):
        print(f"[OTP VERIFY] Invalid OTP format: {otp_input}")
        return jsonify({"error": "invalid otp format"}), 400

    print(
        f"[OTP VERIFY] Comparing OTP: input={otp_int}, stored={record['otp']}")

    if otp_int != record["otp"]:
        print(f"[OTP VERIFY] OTP mismatch for {email}")
        return jsonify({"error": "invalid otp"}), 400

    # MARK EMAIL VERIFIED IN DB
    cursor = db.cursor()
    cursor.execute(
        "UPDATE useraccount SET IsEmailVerified = 1 WHERE Email = %s",
        (email, ))
    db.commit()
    cursor.close()
    db.close()

    otp_storage.pop(email, None)

    return jsonify({"message": "OTP verified successfully"}), 200


# ------------------------- FAVORITES -------------------------
@users_bp.route("/users/<int:user_id>/favorites", methods=["POST"])
def add_favorite(user_id):
    data = request.get_json(force=True)
    restaurant_id = data.get("restaurant_id")
    if not restaurant_id:
        return jsonify({"error": "restaurant_id required"}), 400
    ok = UserAccount.add_favorite(user_id, restaurant_id)
    if ok:
        return jsonify({"message": "added to favorites"}), 200
    return jsonify({"error": "failed to add favorite"}), 500


@users_bp.route("/users/<int:user_id>/favorites/<int:restaurant_id>",
                methods=["DELETE"])
def remove_favorite(user_id, restaurant_id):
    ok = UserAccount.remove_favorite(user_id, restaurant_id)
    if ok:
        return jsonify({"message": "removed from favorites"}), 200
    return jsonify({"error": "failed to remove favorite"}), 500


@users_bp.route("/users/<int:user_id>/favorites", methods=["GET"])
def get_favorites(user_id):
    rows = UserAccount.get_favorites(user_id)
    return jsonify(rows), 200

@users_bp.route("/dashboard_metrics/<int:user_id>", methods=["GET"])
def get_dashboard_metrics(user_id):
    rows = UserAccount.get_dashboard_metrics(user_id)
    return jsonify(rows), 200


# ------------------------- USER PROFILE -------------------------
@users_bp.route("/<int:user_id>", methods=["GET"])
def get_user_profile(user_id):
    """Get user profile by ID"""
    user = UserAccount.get_by_id(user_id)
    if user:
        return jsonify(UserAccount.row_to_dict(user)), 200
    return jsonify({"error": "User not found"}), 404


@users_bp.route("/users/<int:user_id>", methods=["PUT"])
def update_profile(user_id):
    data = request.get_json(force=True)
    ok = UserAccount.update_profile(user_id, **data)
    if ok:
        return jsonify({"message": "profile updated"}), 200
    return jsonify({"error": "failed to update profile"}), 500
