#!/usr/bin/env python3
"""
Simple HTTP server to host the Polymer resource pack
Run this script to serve the resource pack on port 8080
"""
import http.server
import socketserver
import os
import hashlib

PORT = 8080
PACK_PATH = "polymer/resource_pack.zip"

class ResourcePackHandler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        if self.path == '/resourcepack.zip' or self.path == '/':
            if os.path.exists(PACK_PATH):
                self.path = '/' + PACK_PATH
            else:
                self.send_error(404, "Resource pack not found. Start the server first to generate it.")
                return
        return http.server.SimpleHTTPRequestHandler.do_GET(self)

def calculate_sha1(filepath):
    """Calculate SHA1 hash of the resource pack"""
    sha1 = hashlib.sha1()
    with open(filepath, 'rb') as f:
        while chunk := f.read(8192):
            sha1.update(chunk)
    return sha1.hexdigest()

if __name__ == "__main__":
    os.chdir("/workspaces/AvatarSMP/volumes/smp")
    
    print(f"Starting resource pack server on port {PORT}...")
    print(f"Looking for resource pack at: {PACK_PATH}")
    
    if os.path.exists(PACK_PATH):
        sha1_hash = calculate_sha1(PACK_PATH)
        print(f"\n✓ Resource pack found!")
        print(f"  SHA1: {sha1_hash}")
        print(f"  URL: http://YOUR_SERVER_IP:{PORT}/resourcepack.zip")
        print(f"\nAdd these to server.properties:")
        print(f"  resource-pack=http://YOUR_SERVER_IP:{PORT}/resourcepack.zip")
        print(f"  resource-pack-sha1={sha1_hash}")
    else:
        print(f"\n⚠ Warning: Resource pack not found at {PACK_PATH}")
        print("Start your Minecraft server first to generate it, then run this script.")
    
    print(f"\nServer running at http://0.0.0.0:{PORT}/")
    
    with socketserver.TCPServer(("", PORT), ResourcePackHandler) as httpd:
        try:
            httpd.serve_forever()
        except KeyboardInterrupt:
            print("\nShutting down server...")
