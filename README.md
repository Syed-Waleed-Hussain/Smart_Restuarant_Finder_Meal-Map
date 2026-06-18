# MealMap - Smart Restaurant Finder

![MealMap Logo](https://img.shields.io/badge/Status-Live-brightgreen)
![Tech Stack](https://img.shields.io/badge/Stack-Python%20%7C%20Flask%20%7C%20Vanilla%20JS-blue)

MealMap is a smart restaurant management and discovery platform. It features a fully responsive frontend built with Vanilla HTML/CSS/JS and a robust backend powered by Python Flask and TiDB (MySQL). 

The platform supports a comprehensive **3-tier Role-Based Access Control (RBAC)** system:
- **Users**: Can browse restaurants, leave reviews, and make reservations.
- **Vendors (Owners)**: Have access to a dedicated dashboard to manage their restaurant details, approve/cancel reservations, create promotions, and update their menus.
- **Admins**: Can oversee the entire platform, manage users, vendors, and view aggregate system statistics.

## 🚀 Live Demo
You can view and test the live application here:  
👉 **[https://mealmap-nu.vercel.app](https://mealmap-nu.vercel.app/)**

---

## 🔐 Test Accounts

To explore the different dashboards and roles without registering, please use the following pre-configured dummy accounts. All accounts use the same password for convenience.

**Password for all accounts:** `Test@1234`

| # | Role | Email | Login Tab |
|---|------|-------|-----------|
| 1 | 🛡️ Admin | `tariq.hussain@gmail.com` | Admin tab |
| 2 | 🍽️ Vendor | `usman.ali@hotmail.com` | Owner tab |
| 3 | 🍽️ Vendor | `hassan.rizvi@gmail.com` | Owner tab |
| 4 | 🍽️ Vendor | `noman.aslam@gmail.com` | Owner tab |
| 5 | 🍽️ Vendor | `faisal.malik@gmail.com` | Owner tab |
| 6 | 🍽️ Vendor | `adnan.rauf@hotmail.com` | Owner tab |
| 7 | 👤 User | `ali.raza@gmail.com` | User tab |
| 8 | 👤 User | `ayesha.khan@yahoo.com` | User tab |
| 9 | 👤 User | `bilal.ahmed@gmail.com` | User tab |
| 10 | 👤 User | `fatima.zahid@gmail.com` | User tab |
| 11 | 👤 User | `sana.javed@gmail.com` | User tab |

*Note: Make sure to select the correct role tab on the Login page before entering the credentials!*

---

## 🛠️ Tech Stack
- **Frontend**: Vanilla HTML5, CSS3, JavaScript (ES6)
- **Backend**: Python 3, Flask, JWT for Authentication
- **Database**: TiDB (MySQL compatible)
- **Deployment**: Vercel (Serverless Functions for Python + Static hosting for Frontend)

## 💻 Local Setup

If you want to run this project locally on your machine:

1. **Clone the repository:**
   ```bash
   git clone https://github.com/yourusername/mealmap.git
   cd mealmap
   ```

2. **Set up the Python Environment:**
   ```bash
   cd backend
   pip install -r requirements.txt
   ```

3. **Configure Environment Variables:**
   Create a `.env` file in the `backend` directory (you can copy `.env.example`) and add your database credentials and JWT secret.

4. **Run the Application:**
   ```bash
   python app.py
   ```
   The application will be available at `http://localhost:8000`.
