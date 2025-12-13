# Restaurant Owner Dashboard Setup Instructions

## ⚠️ CRITICAL SECURITY WARNING

**The owner dashboard endpoints are NOT production-ready.** They require proper authentication before deployment.

### Current State (MVP/Development Only)
- Owner endpoints accept `OwnerID` from the request body (client-supplied)
- Ownership is verified by comparing client-supplied ID against database
- **Anyone can impersonate any owner by supplying their ID**
- **DO NOT deploy to production without implementing proper authentication**

### Required Before Production

#### 1. Implement Server-Side Authentication
You must add JWT or session-based authentication. Options:

**Option A: JWT Authentication (Recommended)**
```python
# Install: pip install pyjwt
from functools import wraps
import jwt

def require_auth(f):
    @wraps(f)
    def decorated(*args, **kwargs):
        token = request.headers.get('Authorization')
        if not token:
            return jsonify({"error": "No token provided"}), 401
        try:
            data = jwt.decode(token, SECRET_KEY, algorithms=["HS256"])
            kwargs['authenticated_user_id'] = data['user_id']
        except:
            return jsonify({"error": "Invalid token"}), 401
        return f(*args, **kwargs)
    return decorated

# Apply to all owner endpoints:
@owners_bp.route("/restaurants/<int:owner_id>", methods=["GET"])
@require_auth
def get_owner_restaurants(owner_id, authenticated_user_id):
    # Verify owner_id matches authenticated_user_id
    if owner_id != authenticated_user_id:
        return jsonify({"error": "Unauthorized"}), 403
    ...
```

**Option B: Flask-Login Sessions**
```python
from flask_login import login_required, current_user

@owners_bp.route("/restaurants", methods=["GET"])
@login_required
def get_owner_restaurants():
    owner_id = current_user.id
    restaurants = Restaurant.get_restaurants_by_owner(owner_id)
    ...
```

#### 2. Update All Owner Endpoints
Remove `OwnerID` from request bodies and derive it from authenticated session:
- Remove `OwnerID` parameter from all POST/PUT request bodies
- Use `authenticated_user_id` from JWT/session instead
- Keep ownership verification as additional security layer

#### 3. Update Frontend
```javascript
// Add JWT token to all owner requests
const token = localStorage.getItem('jwt_token');
const response = await fetch('/api/owners/restaurants', {
    headers: {
        'Authorization': `Bearer ${token}`,
        'Content-Type': 'application/json'
    }
});
```

## Database Setup

### Step 1: Run the Migration
Execute the SQL migration script on your MySQL database:

```bash
mysql -h YOUR_HOST -u YOUR_USER -p YOUR_DATABASE < backend/migrations/001_add_owner_id_to_restaurant.sql
```

Or manually run the SQL:
```sql
ALTER TABLE restaurant ADD COLUMN OwnerID INT NULL;
ALTER TABLE restaurant ADD CONSTRAINT fk_restaurant_owner FOREIGN KEY (OwnerID) REFERENCES useraccount(Id) ON DELETE SET NULL;
CREATE INDEX idx_restaurant_owner ON restaurant(OwnerID);
```

### Step 2: Assign Restaurant Owners
Update existing restaurants to assign owners:

```sql
-- Assign a user as owner of a restaurant
UPDATE restaurant 
SET OwnerID = <user_id_from_useraccount_table> 
WHERE RestaurantID = <restaurant_id>;
```

### Step 3: Verify Setup
```sql
-- Check which restaurants have owners
SELECT r.RestaurantID, r.Name, r.OwnerID, u.Email 
FROM restaurant r
LEFT JOIN useraccount u ON r.OwnerID = u.Id;
```

## Testing the Owner Dashboard

### 1. Create a Test Owner Account
```sql
-- Find or create a user account
INSERT INTO useraccount (FirstName, LastName, Email, ContactNo, PasswordHash, Role, IsEmailVerified, CreatedAt)
VALUES ('John', 'Doe', 'owner@test.com', '1234567890', 'hashed_password', 'owner', 1, NOW());

-- Get the user ID
SELECT Id FROM useraccount WHERE Email = 'owner@test.com';
```

### 2. Assign Restaurant to Owner
```sql
-- Assuming user ID is 5 and restaurant ID is 1
UPDATE restaurant SET OwnerID = 5 WHERE RestaurantID = 1;
```

### 3. Login and Access Dashboard
1. Login with the owner account credentials
2. Navigate to `/owner-dashboard`
3. You should see your assigned restaurant(s) in the dropdown

## Feature Overview

### Restaurant Information Management
- Update restaurant name and description
- View location, cuisine, and rating (read-only)

### Reservation Management
- View all reservations for your restaurant
- Filter by status (Pending, Confirmed, Cancelled)
- Confirm pending reservations
- Cancel reservations
- See customer details (name, email, phone, guest count)

### Menu Management
- Add new menu items
- Edit existing menu items (name, description, price, image)
- Delete menu items
- Toggle item availability (show/hide from customers)

## API Endpoints Reference

All endpoints require `OwnerID` in request body (MUST be replaced with authenticated session):

- `GET /owners/restaurants/<owner_id>` - List owned restaurants
- `PUT /owners/restaurant/<restaurant_id>` - Update restaurant
- `GET /owners/restaurant/<restaurant_id>/reservations` - View reservations
- `POST /owners/reservation/<id>/confirm` - Confirm reservation
- `POST /owners/reservation/<id>/cancel` - Cancel reservation
- `POST /owners/restaurant/<restaurant_id>/menu/add` - Add menu item
- `PUT /owners/menu/item/<item_id>` - Update menu item
- `DELETE /owners/menu/item/<item_id>` - Delete menu item
- `POST /owners/menu/item/<item_id>/toggle` - Toggle availability

## Security Checklist Before Production

- [ ] JWT or session-based authentication implemented
- [ ] All owner endpoints protected with authentication decorators
- [ ] `OwnerID` removed from client-supplied request bodies
- [ ] Owner identity derived from authenticated session only
- [ ] HTTPS enabled for all requests
- [ ] Rate limiting added to prevent abuse
- [ ] Input validation and SQL injection prevention verified
- [ ] CORS configured for specific domains only
- [ ] Error messages don't leak sensitive information

## Support

For questions or issues:
1. Check SECURITY_NOTES.md for additional security considerations
2. Review the existing authentication system in `backend/routes/users.py`
3. Consider using existing authentication patterns for consistency
