# backend/app.py
import os
from flask import Flask, send_from_directory, abort
from flask_cors import CORS
from routes.restaurants import restaurants_bp
from routes.users import users_bp
from routes.reservations import reservations_bp  
from routes.recommend import recommend_bp
from routes.menu import menu_bp
from routes.favorites import favorites_bp
from routes.photos import photos_bp
from routes.promotions import promotions_bp
from routes.ratings import ratings_bp
from routes.owners import owners_bp

frontend_folder = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "frontend")

# Disable Flask's built-in static file handler to prevent it from
# intercepting clean URLs (like /restaurants) and returning 404 before
# our catch-all route can map them to .html files.
app = Flask(__name__, static_folder=None)
CORS(app)

# All API blueprints under /api/ to separate from frontend page routes
app.register_blueprint(restaurants_bp, url_prefix="/api/restaurants")
app.register_blueprint(users_bp, url_prefix="/api/users")
app.register_blueprint(reservations_bp, url_prefix="/api/reservations") 
app.register_blueprint(recommend_bp, url_prefix="/api/recommend")
app.register_blueprint(menu_bp, url_prefix="/api/menu")
app.register_blueprint(favorites_bp, url_prefix="/api/favorites")
app.register_blueprint(photos_bp, url_prefix="/api/photos")
app.register_blueprint(promotions_bp, url_prefix="/api/promotions")
app.register_blueprint(ratings_bp, url_prefix="/api/ratings")
app.register_blueprint(owners_bp, url_prefix="/api/owners")

@app.route('/', defaults={'path': ''})
@app.route('/<path:path>')
def serve_frontend(path):
    # (a) If path is empty, serve the homepage
    if path == '':
        return send_from_directory(frontend_folder, 'index.html')

    # (b) If path contains a dot, it's a static asset (.css, .js, .jpg, etc.)
    if '.' in path:
        return send_from_directory(frontend_folder, path)

    # (c) Clean URL (no dot) — append .html and serve the page
    try:
        return send_from_directory(frontend_folder, path + '.html')
    except Exception:
        # (d) If the .html file doesn't exist, return a proper 404
        abort(404)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000, debug=True)
