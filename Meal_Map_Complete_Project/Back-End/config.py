import mysql.connector
from mysql.connector import pooling
import os

# DB_HOST = os.environ.get("MYSQL_HOST", "localhost")
# DB_PORT = int(os.environ.get("MYSQL_PORT") or 3306)
# DB_USER = os.environ.get("MYSQL_USER", "root")
# DB_PASS = os.environ.get("MYSQL_PASSWORD", "")
# DB_NAME = os.environ.get("MYSQL_DATABASE", "smart_restaurant_finder")

# DB_HOST = os.environ.get("MYSQL_HOST", "centerbeam.proxy.rlwy.net")
# DB_PORT = int(os.environ.get("MYSQL_PORT") or 52823)
# DB_USER = os.environ.get("MYSQL_USER", "root")
# DB_PASS = os.environ.get("MYSQL_PASSWORD", "VHPHFqjLyBdDZyfWATgXzPmEllhpRTOQ")
# DB_NAME = os.environ.get("MYSQL_DATABASE", "railway")

DB_HOST = os.environ.get("MYSQL_HOST", "mysql-8a37a39-smart-restaurant-finder.i.aivencloud.com")
DB_PORT = int(os.environ.get("MYSQL_PORT") or 19276)
DB_USER = os.environ.get("MYSQL_USER", "avnadmin")
DB_PASS = os.environ.get("MYSQL_PASSWORD", "AVNS_Jn7a8UjgB1kxMPJPec8")
DB_NAME = os.environ.get("MYSQL_DATABASE", "defaultdb")

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
    """Return a connection from the pool when available, else fallback to a new connection."""
    if pool:
        return pool.get_connection()
    # fallback: create a direct connection
    return mysql.connector.connect(**CONN_PARAMS)