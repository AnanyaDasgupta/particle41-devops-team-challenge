from flask import Flask, request, jsonify
from datetime import datetime
from zoneinfo import ZoneInfo
import ipaddress
import requests

app = Flask(__name__)

@app.get("/")
def get_time():
    remote_ip = request.headers.get("X-Forwarded-For", request.remote_addr)
    try:
        ip = str(ipaddress.ip_address(remote_ip.split(",")[0].strip()))
    except ValueError:
        ip = "Invalid IP"

    # Default timezone fallback
    timezone_str = "UTC"

    # Get timezone using external IP lookup
    try:
        resp = requests.get(f"https://ipapi.co/{ip}/timezone/")
        if resp.status_code == 200:
            timezone_str = resp.text.strip()
    except Exception:
        pass  # fallback to UTC if API fails

    try:
        local_time = datetime.now(ZoneInfo(timezone_str))
    except Exception:
        local_time = datetime.now()

    return jsonify({
        "timestamp": local_time.isoformat(),
        "ip": ip
    })

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
