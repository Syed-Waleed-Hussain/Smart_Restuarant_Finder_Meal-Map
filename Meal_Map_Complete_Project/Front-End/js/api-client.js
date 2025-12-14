/**
 * API Client for Smart Restaurant Finder Backend
 * Handles all communication with the Flask backend
 */

class RestaurantAPI {
    constructor() {
        // Use proxy approach for all browser environments
        // The frontend server (server.py) proxies /api/* to backend at localhost:8000
        // This works in both Replit and local development

        // if (typeof window !== 'undefined') {
        //     this.apiBase = '/api';
        // } else {
            // Node environment fallback
        this.apiBase = 'http://127.0.0.1:8000';
        // }

        this.user = null;
        this.userId = null;
        this.loadAuth();

        console.log('API Base URL:', this.apiBase);
    }

    loadAuth() {
        try {
            const userStr = localStorage.getItem('user');
            const userId = localStorage.getItem('userId');
            if (userStr && userId) {
                this.user = JSON.parse(userStr);
                this.userId = userId;
            }
        } catch (e) {
            console.error('Failed to load auth state:', e);
        }
    }

    saveAuth(user, userId) {
        this.user = user;
        this.userId = userId || user.UserID || user.Id;
        localStorage.setItem('user', JSON.stringify(user));
        localStorage.setItem('userId', this.userId);
    }

    clearAuth() {
        this.user = null;
        this.userId = null;
        localStorage.removeItem('user');
        localStorage.removeItem('userId');
    }

    isAuthenticated() {
        return !!this.user && !!this.userId;
    }

    getCurrentUser() {
        return this.user;
    }

    getCurrentUserId() {
        return this.userId;
    }

    /**
     * Generic fetch wrapper with error handling
     */
    async request(endpoint, options = {}) {
        try {
            const response = await fetch(`${this.apiBase}${endpoint}`, {
                ...options,
                headers: {
                    'Content-Type': 'application/json',
                    ...options.headers,
                },
            });

            if (!response.ok) {
                const errorData = await response.json().catch(() => ({}));
                const errorMessage = errorData.error || errorData.message || response.statusText;
                throw new Error(errorMessage);
            }

            return await response.json();
        } catch (error) {
            console.error('API Request failed:', error);
            throw error;
        }
    }

    // ==================== RESTAURANTS ====================

    /**
     * Get recommended restaurants
     * @param {number} userLat - User latitude (optional)
     * @param {number} userLon - User longitude (optional)
     */
    async getRecommendedRestaurants(userLat = null, userLon = null) {
        let endpoint = '/restaurants/recommend';
        if (userLat && userLon) {
            endpoint += `?user_lat=${userLat}&user_lon=${userLon}`;
        }
        return await this.request(endpoint);
    }

    /**
     * Search restaurants
     * @param {string} searchTerm - Search query
     */
    async searchRestaurants(searchTerm, minPrice = null, maxPrice = null) {
        let endpoint = `/restaurants/search?q=${encodeURIComponent(searchTerm)}`;
        if (minPrice !== null && minPrice !== undefined && minPrice !== '') {
            endpoint += `&min_price=${encodeURIComponent(minPrice)}`;
        }
        if (maxPrice !== null && maxPrice !== undefined && maxPrice !== '') {
            endpoint += `&max_price=${encodeURIComponent(maxPrice)}`;
        }
        return await this.request(endpoint);
    }

    /**
     * Get restaurant details by ID
     * @param {number} restaurantId
     */
    async getRestaurantDetails(restaurantId) {
        return await this.request(`/restaurants/${restaurantId}`);
    }

    // ==================== MENU ====================

    /**
     * Get menu items for a restaurant
     * @param {number} restaurantId
     */
    async getMenuItems(restaurantId) {
        return await this.request(`/menu/${restaurantId}`);
    }

    // ==================== USERS ====================

    /**
     * User login
     * @param {string} email
     * @param {string} password
     */
    async login(email, password) {
        return await this.request('/users/login', {
            method: 'POST',
            body: JSON.stringify({ email, password }),
        });
    }

    /**
     * User registration
     * @param {object} userData - User registration data
     */
    async register(userData) {
        const payload = {
            first_name: userData.name ? userData.name.split(' ')[0] : userData.first_name,
            last_name: userData.name ? userData.name.split(' ').slice(1).join(' ') : userData.last_name,
            email: userData.email,
            contact: userData.phone || userData.contact,
            password: userData.password
        };
        return await this.request('/users/register', {
            method: 'POST',
            body: JSON.stringify(payload),
        });
    }

    /**
     * Verify OTP for email verification
     * @param {string} email
     * @param {string} otp
     */
    async verifyOTP(email, otp) {
        return await this.request('/users/verify_otp', {
            method: 'POST',
            body: JSON.stringify({ email, otp }),
        });
    }

    /**
     * Get user profile
     * @param {number} userId
     */
    async getUserProfile(userId) {
        return await this.request(`/users/${userId}`);
    }

    /**
     * Update user profile
     * @param {number} userId
     * @param {object} profileData
     */
    async updateUserProfile(userId, profileData) {
        return await this.request(`/users/${userId}`, {
            method: 'PUT',
            body: JSON.stringify(profileData),
        });
    }

    /**
     * Get user dashboard metrics
     * @param {number} userId
     */
    async getUserDashboardMetrics(userId) {
        return await this.request(`/users/dashboard_metrics/${userId}`);
    }


    // ==================== RESERVATIONS ====================

    /**
     * Create a reservation
     * @param {object} reservationData
     * Expected format: {
     *   RestaurantID: int,
     *   UserID: int,
     *   GuestCount: int (optional, default 1),
     *   ReservationTime: "YYYY-MM-DD HH:MM:SS",
     *   TableID: int (optional),
     *   Notes: "string" (optional)
     * }
     */
    async createReservation(reservationData) {
        const payload = {
            RestaurantID: reservationData.restaurantId || reservationData.RestaurantID,
            UserID: reservationData.userId || reservationData.UserID || this.userId,
            GuestCount: reservationData.guestCount || reservationData.GuestCount || 1,
            ReservationTime: reservationData.reservationTime || reservationData.ReservationTime,
            TableID: reservationData.tableId || reservationData.TableID || null,
            Notes: reservationData.notes || reservationData.Notes || null
        };
        return await this.request('/reservations/create', {
            method: 'POST',
            body: JSON.stringify(payload),
        });
    }

    /**
     * Get user reservations
     * @param {number} userId
     */
    async getUserReservations(userId) {
        return await this.request(`/reservations/user/${userId}`);
    }

    /**
     * Cancel a reservation
     * @param {number} reservationId
     */
    async cancelReservation(reservationId) {
        return await this.request(`/reservations/cancel/${reservationId}`, {
            method: 'POST',
        });
    }

    /**
     * Get available tables for a restaurant
     * @param {number} restaurantId
     */
    async getAvailableTables(restaurantId) {
        return await this.request(`/reservations/restaurant/${restaurantId}/tables`);
    }

    // ==================== FAVORITES ====================

    /**
     * Get user favorites
     * @param {number} userId
     */
    async getUserFavorites(userId) {
        return await this.request(`/favorites/user/${userId}`);
    }

    /**
     * Add restaurant to favorites
     * @param {number} userId
     * @param {number} restaurantId
     */
    async addFavorite(userId, restaurantId) {
        return await this.request('/favorites/add', {
            method: 'POST',
            body: JSON.stringify({ UserID: parseInt(userId), RestaurantID: parseInt(restaurantId) }),
        });
    }

    /**
     * Remove restaurant from favorites
     * @param {number} userId
     * @param {number} restaurantId
     */
    async removeFavorite(userId, restaurantId) {
        return await this.request('/favorites/remove', {
            method: 'POST',
            body: JSON.stringify({ UserID: parseInt(userId), RestaurantID: parseInt(restaurantId) }),
        });
    }

    // ==================== PROMOTIONS ====================

    /**
     * Get active promotions
     */
    async getActivePromotions() {
        return await this.request('/promotions/active');
    }

    /**
     * Get promotions for a specific restaurant
     * @param {number} restaurantId
     */
    async getRestaurantPromotions(restaurantId) {
        return await this.request(`/promotions/restaurant/${restaurantId}`);
    }

    // ==================== PHOTOS ====================

    /**
     * Get photos for a restaurant
     * @param {number} restaurantId
     */
    async getRestaurantPhotos(restaurantId) {
        return await this.request(`/photos/restaurant/${restaurantId}`);
    }

    // ==================== RECOMMENDATIONS ====================

    /**
     * Get personalized recommendations
     * @param {number} userId
     */
    async getPersonalizedRecommendations(userId) {
        return await this.request(`/recommend/${userId}`);
    }

    /**
     * Get filtered recommendations
     * @param {object} filters - Filter criteria
     * Expected format: {
     *   Cuisines: ["BBQ", "Pakistani"], // array of cuisine types
     *   MinPrice: 500,
     *   MinRating: 4,
     *   Location: "DHA",
     *   SortBy: "rating", // or "price" or "distance"
     *   Limit: 20
     * }
     */
    async getFilteredRecommendations(filters) {
        const payload = {
            Cuisines: filters.cuisines || filters.Cuisines || null,
            MinPrice: filters.minPrice || filters.MinPrice || null,
            MinRating: filters.minRating || filters.MinRating || null,
            Location: filters.location || filters.Location || null,
            SortBy: filters.sortBy || filters.SortBy || "rating",
            Limit: filters.limit || filters.Limit || 30
        };
        return await this.request('/recommend/', {
            method: 'POST',
            body: JSON.stringify(payload),
        });
    }

    // ==================== MENU ITEMS ====================

    /**
     * Get menu item details
     * @param {number} itemId
     */
    async getMenuItem(itemId) {
        return await this.request(`/menu/item/${itemId}`);
    }

    // ==================== RATINGS & REVIEWS ====================

    /**
     * Submit a rating and review for a restaurant
     * @param {number} userId
     * @param {number} restaurantId
     * @param {number} ratingScore - Rating from 1-5
     * @param {string} reviewText - Optional review text
     */
    async submitReview(userId, restaurantId, ratingScore, reviewText = '') {
        return await this.request('/ratings/add', {
            method: 'POST',
            body: JSON.stringify({
                UserID: userId,
                RestaurantID: restaurantId,
                RatingScore: ratingScore,
                Review: reviewText
            }),
        });
    }

    /**
     * Get all reviews for a restaurant
     * @param {number} restaurantId
     */
    async getRestaurantReviews(restaurantId) {
        return await this.request(`/ratings/restaurant/${restaurantId}`);
    }

    /**
     * Get a user's rating for a specific restaurant
     * @param {number} userId
     * @param {number} restaurantId
     */
    async getUserRating(userId, restaurantId) {
        return await this.request(`/ratings/user/${userId}/restaurant/${restaurantId}`);
    }
}

// Create a singleton instance and expose it globally
const api = new RestaurantAPI();
window.api = api; // Expose to window for use in inline scripts

// Export for use in other scripts (Node.js/module systems)
if (typeof module !== 'undefined' && module.exports) {
    module.exports = api;
}
