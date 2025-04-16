# ⏱️ SimpleTimeService

A minimalist Flask-based microservice that returns the current local timestamp and IP address of the client in JSON format.

---

## 📦 Features

- Returns:
  - `timestamp` in client's local timezone
  - `ip` address of the requester
  - `timezone` (guessed via IP geolocation)
- Built using **Python 3.12** and **Flask**
- Fully Dockerized and runs as a non-root user
- Lightweight image based on `python:3.12-slim`

---

## 📄 API Endpoint

**GET /**

Response:

```json
{
  "timestamp": "2025-04-16T10:42:33.123456+05:30",
  "ip": "122.161.66.85",
  "timezone": "Asia/Kolkata"
}
```

---

## 🚀 Run Locally

### 📁 Requirements

- Python 3.12+
- pip

Install dependencies:

```bash
pip install -r requirements.txt
```

Run the app:

```bash
python SimpleTimeService.py
```

Visit: [http://localhost:5000](http://localhost:5000)

---

## 🐳 Run with Docker

### 🔨 Build the Image

```bash
docker build -t simpletimeservice .
```

### ▶️ Run the Container

```bash
docker run -p 5000:5000 simpletimeservice
```

Visit: [http://localhost:5000](http://localhost:5000)

---

## ☁️ Pull from DockerHub

If you want to run the image directly from DockerHub:

```bash
docker pull ananyadasgupta/simpletimeservice:latest
docker run -p 5000:5000 ananyadasgupta/simpletimeservice:latest
```

---

## 📁 Project Structure

```
.
├── SimpleTimeService.py       # Main Flask app
├── requirements.txt           # Python dependencies
├── Dockerfile                 # Docker container config
└── README.md                  # You're here!
```

---

## 🔒 Security

- The container runs as a **non-root user** (`appuser`)
- The image is built from a **minimal base** (`python:3.12-slim`) to keep it lightweight

---

## 🛠️ Author

**Ananya Dasgupta**  
📧 ananyadasgupta280@gmail.com  
🐙 [GitHub](https://github.com/AnanyaDasgupta)

---

## 📄 License

This project is open-source under the MIT License.
