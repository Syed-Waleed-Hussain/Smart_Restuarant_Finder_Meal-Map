import mysql.connector
from mysql.connector import pooling
import os
from dotenv import load_dotenv

# Load environment variables from .env file
load_dotenv()

DB_HOST = os.environ.get("DB_HOST", "localhost")
DB_PORT = int(os.environ.get("DB_PORT", 3306))
DB_USER = os.environ.get("DB_USER", "root")
DB_PASS = os.environ.get("DB_PASSWORD", "")
DB_NAME = os.environ.get("DB_NAME", "smart_restaurant_finder")
JWT_SECRET = os.environ.get("JWT_SECRET", "fallback_secret_key_for_dev_only")

CONN_PARAMS = dict(
    host=DB_HOST,
    port=DB_PORT,
    user=DB_USER,
    password=DB_PASS,
    database=DB_NAME,
    auth_plugin="mysql_native_password",
)

# Create a connection pool to avoid per-request TCP handshake overhead.
POOL_NAME = os.environ.get("MYSQL_POOL_NAME", "rest_pool")
POOL_SIZE = int(os.environ.get("MYSQL_POOL_SIZE", 3))

try:
    pool = pooling.MySQLConnectionPool(pool_name=POOL_NAME, pool_size=POOL_SIZE, **CONN_PARAMS)
    # test getting a connection from pool
    conn = pool.get_connection()
    cursor = conn.cursor(buffered=True)
    cursor.execute("SHOW TABLES;")
    _ = cursor.fetchall()
    cursor.close()
    conn.close()
    print(f"Database pool '{POOL_NAME}' created successfully (size={POOL_SIZE})!")
except mysql.connector.Error as err:
    print("Connection error creating pool:", err)
    pool = None


def get_db():
    """Return a connection from the pool when available, else fallback to a new connection.
    Disables ONLY_FULL_GROUP_BY at the session level so legacy GROUP BY queries work on TiDB."""
    if pool:
        conn = pool.get_connection()
    else:
        conn = mysql.connector.connect(**CONN_PARAMS)

    try:
        cur = conn.cursor()
        cur.execute("SET SESSION sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));")
        cur.close()
    except mysql.connector.Error:
        pass  # Non-fatal: if it fails the query may still work

    return conn
