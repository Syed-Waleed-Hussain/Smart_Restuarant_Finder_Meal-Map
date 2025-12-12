# backend/utils/map.py

import math

def haversine_distance(lat1, lon1, lat2, lon2):
    """
    Calculate distance in kilometers between two latitude/longitude points
    """
    R = 6371  # Radius of Earth in km
    phi1 = math.radians(lat1)
    phi2 = math.radians(lat2)
    d_phi = math.radians(lat2 - lat1)
    d_lambda = math.radians(lon2 - lon1)

    a = math.sin(d_phi/2)**2 + math.cos(phi1) * math.cos(phi2) * math.sin(d_lambda/2)**2
    c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a))
    distance = R * c
    return distance
