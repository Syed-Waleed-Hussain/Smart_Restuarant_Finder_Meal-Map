import folium

m = folium.Map(location=[24.8607, 67.0011], zoom_start=12)
m.save("test_map.html")
print("Map created! Open test_map.html in browser.")
