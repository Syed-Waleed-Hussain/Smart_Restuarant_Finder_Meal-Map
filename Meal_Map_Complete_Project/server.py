#!/usr/bin/env python3
"""
Proxy HTTP server to serve static files and forward API requests to backend.

"""
import http.server
import socketserver
import urllib.request
import urllib.error
import json
import os

PORT = 5000
HOST = "0.0.0.0"
FRONTEND_DIR = "frontend"
BACKEND_URL = "http://0.0.0.0:8000"

URL_REWRITES = {
    '/restaurants': '/restaurants.html',
    '/login': '/login.html',
    '/signup': '/signup.html',
    '/favorites': '/favorites.html',
    '/promotions': '/promotions.html',
    '/restaurant-detail': '/restaurant-detail.html',
    '/verify-otp': '/verify-otp.html',
    '/dashboard': '/dashboard.html',
    '/profile': '/profile.html',
    '/my-reservations': '/my-reservations.html',
    '/owner-dashboard': '/owner-dashboard.html',
}

class ProxyHandler(http.server.SimpleHTTPRequestHandler):
    """Custom handler with API proxy, clean URL routing, and cache control"""
    
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=FRONTEND_DIR, **kwargs)
    
    def rewrite_path(self, path):
        """Rewrite clean URLs to actual file paths"""
        clean_path = path.split('?')[0]
        
        if clean_path in URL_REWRITES:
            query_string = '?' + path.split('?')[1] if '?' in path else ''
            return URL_REWRITES[clean_path] + query_string
        
        return path
    
    def do_GET(self):
        if self.path.startswith('/api/'):
            self.proxy_request()
        else:
            original_path = self.path
            self.path = self.rewrite_path(self.path)
            
            file_path = os.path.join(FRONTEND_DIR, self.path.split('?')[0].lstrip('/'))
            
            if not os.path.exists(file_path) and not self.path.startswith('/'):
                if os.path.isdir(os.path.join(FRONTEND_DIR, self.path.lstrip('/'))):
                    index_path = os.path.join(file_path, 'index.html')
                    if os.path.exists(index_path):
                        super().do_GET()
                        return
                
                self.send_error(404, f"File not found: {original_path}")
                return
            
            super().do_GET()
    
    def do_HEAD(self):
        if self.path.startswith('/api/'):
            self.proxy_request()
        else:
            self.path = self.rewrite_path(self.path)
            super().do_HEAD()
    
    def do_POST(self):
        if self.path.startswith('/api/'):
            self.proxy_request()
        else:
            self.send_error(405, "Method Not Allowed")
    
    def do_PUT(self):
        if self.path.startswith('/api/'):
            self.proxy_request()
        else:
            self.send_error(405, "Method Not Allowed")
    
    def do_DELETE(self):
        if self.path.startswith('/api/'):
            self.proxy_request()
        else:
            self.send_error(405, "Method Not Allowed")
    
    def proxy_request(self):
        """Forward API requests to backend server"""
        # Remove /api prefix
        backend_path = self.path.replace('/api', '', 1)
        backend_url = f"{BACKEND_URL}{backend_path}"
        
        try:
            # Read request body
            content_length = int(self.headers.get('Content-Length', 0))
            body = self.rfile.read(content_length) if content_length > 0 else None
            
            # Prepare request
            headers = {'Content-Type': 'application/json'}
            req = urllib.request.Request(
                backend_url,
                data=body,
                headers=headers,
                method=self.command
            )
            
            # Forward to backend
            with urllib.request.urlopen(req, timeout=30) as response:
                self.send_response(response.status)
                self.send_header('Content-Type', 'application/json')
                self.send_header('Access-Control-Allow-Origin', '*')
                self.end_headers()
                self.wfile.write(response.read())
                
        except urllib.error.HTTPError as e:
            self.send_response(e.code)
            self.send_header('Content-Type', 'application/json')
            self.send_header('Access-Control-Allow-Origin', '*')
            self.end_headers()
            self.wfile.write(e.read())
            
        except urllib.error.URLError as e:
            self.send_response(503)
            self.send_header('Content-Type', 'application/json')
            self.send_header('Access-Control-Allow-Origin', '*')
            self.end_headers()
            error = json.dumps({"error": f"Backend unavailable: {str(e)}"})
            self.wfile.write(error.encode())
            
        except Exception as e:
            self.send_response(500)
            self.send_header('Content-Type', 'application/json')
            self.send_header('Access-Control-Allow-Origin', '*')
            self.end_headers()
            error = json.dumps({"error": f"Proxy error: {str(e)}"})
            self.wfile.write(error.encode())
    
    def end_headers(self):
        # Disable caching for static files
        if not self.path.startswith('/api/'):
            self.send_header('Cache-Control', 'no-cache, no-store, must-revalidate')
            self.send_header('Pragma', 'no-cache')
            self.send_header('Expires', '0')
        super().end_headers()

if __name__ == "__main__":
    # Enable address reuse before creating the server
    socketserver.TCPServer.allow_reuse_address = True
    with socketserver.TCPServer((HOST, PORT), ProxyHandler) as httpd:
        print(f"Frontend server running at http://127.0.0.1:{PORT}/")
        print(f"Serving static files from {FRONTEND_DIR}/ directory")
        print(f"Proxying /api/* requests to {BACKEND_URL}")
        try:
            httpd.serve_forever()
        except KeyboardInterrupt:
            print("\nServer stopped.")
