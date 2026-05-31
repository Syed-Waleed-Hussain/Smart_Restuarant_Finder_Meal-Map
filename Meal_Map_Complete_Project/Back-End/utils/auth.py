from functools import wraps
from flask import request, jsonify
import jwt
import os
import sys

# Ensure models can be imported
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
from models.useraccount import UserAccount

JWT_SECRET = os.environ.get("JWT_SECRET", "fallback_secret_key_for_dev_only")


def _extract_current_user():
    """Shared logic to extract and validate the JWT token from the request."""
    token = None
    # Expecting header: Authorization: Bearer <token>
    if "Authorization" in request.headers:
        auth_header = request.headers["Authorization"]
        if auth_header.startswith("Bearer "):
            token = auth_header.split(" ")[1]

    if not token:
        return None, (jsonify({"error": "Authentication token is missing"}), 401)

    try:
        data = jwt.decode(token, JWT_SECRET, algorithms=["HS256"])
        current_user = UserAccount.get_user_by_id(data["user_id"])
        if not current_user:
            return None, (jsonify({"error": "Invalid token payload"}), 401)

        return current_user, None

    except jwt.ExpiredSignatureError:
        return None, (jsonify({"error": "Token has expired"}), 401)
    except jwt.InvalidTokenError:
        return None, (jsonify({"error": "Invalid token"}), 401)


def token_required(f):
    """Decorator: Any authenticated user (user, vendor, admin)."""
    @wraps(f)
    def decorated(*args, **kwargs):
        current_user, error_response = _extract_current_user()
        if error_response:
            return error_response
        return f(current_user, *args, **kwargs)
    return decorated


def vendor_required(f):
    """Decorator: Only 'vendor' or 'admin' roles may access."""
    @wraps(f)
    def decorated(*args, **kwargs):
        current_user, error_response = _extract_current_user()
        if error_response:
            return error_response

        role = (current_user.get("Role") or "").lower()
        # Allow legacy 'owner' role to pass as vendor
        if role not in ("vendor", "owner", "admin"):
            return jsonify({"error": "Vendor or Admin access required"}), 403

        return f(current_user, *args, **kwargs)
    return decorated


def admin_required(f):
    """Decorator: Strictly 'admin' role only."""
    @wraps(f)
    def decorated(*args, **kwargs):
        current_user, error_response = _extract_current_user()
        if error_response:
            return error_response

        role = (current_user.get("Role") or "").lower()
        if role != "admin":
            return jsonify({"error": "Admin access required"}), 403

        return f(current_user, *args, **kwargs)
    return decorated
