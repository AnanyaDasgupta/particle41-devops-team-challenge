# ⏱️ SimpleTimeService

SimpleTimeService is a small web application (also known as a microservice) that tells you the **current time** and your **IP address** in a clean and structured JSON format.

It can be run locally on your computer, or in a Docker container.

---

## 🌐 What Does It Do?

When you visit this service in a browser or use a tool like `curl`, it will return a response like this:

```json
{
  "timestamp": "2025-04-16T10:42:33.123456+05:30",
  "ip": "122.161.66.85",
  "timezone": "Asia/Kolkata"
}
```

- `timestamp`: The current date and time (in your local time zone)
- `ip`: Your public IP address (as seen by the server)
- `timezone`: Time zone guessed from your IP

---

## 🧱 Technologies Used

- **Python 3.12** – programming language
- **Flask** – lightweight web framework for building APIs
- **Docker** – for packaging the app into a portable container
- **ipinfo.io API** – to get timezone from your IP address

---

## 🚀 How to Run the App

### ✨ Option 1: Run it on your computer (no Docker)

#### 1. Install Python

- Download from: [https://www.python.org/downloads/](https://www.python.org/downloads/)

Verify installation:

```bash
python --version
```

#### 2. Install required libraries

Open your terminal and run:

```bash
pip install -r requirements.txt
```

#### 3. Start the app

```bash
python SimpleTimeService.py
```

#### 4. Visit the service

Open your browser and go to:

```
http://localhost:5000
```

You’ll see a JSON response with the current time and your IP address.

---

### 🐳 Option 2: Run with Docker

#### 1. Install Docker

Follow instructions: [https://docs.docker.com/get-docker/](https://docs.docker.com/get-docker/)

Verify installation:

```bash
docker --version
```

#### 2. Build the Docker image

Run this command from the project directory:

```bash
docker build -t simpletimeservice .
```

#### 3. Run the container

```bash
docker run -p 5000:5000 simpletimeservice
```

Visit:

```
http://localhost:5000
```

You’ll get the same JSON response.

---

### ☁️ Option 3: Use Pre-Built Image from DockerHub

If you don’t want to build anything, just run:

```bash
docker pull ananyadasgupta/simpletimeservice:latest
docker run -p 5000:5000 ananyadasgupta/simpletimeservice:latest
```

---

## 📁 Files in This Project

```
.
├── SimpleTimeService.py       # Main Python app
├── requirements.txt           # List of required Python packages
├── Dockerfile                 # Instructions to build Docker image
└── README.md                  # You're here!
```

---

## 🔒 Notes

- The Docker container is **secure** and runs as a **non-root user**
- The base image is slim and minimal, which reduces space used

---

## 🛠️ Author

👩‍💻 **Ananya Dasgupta**  
📧 ananyadasgupta280@gmail.com  
🐙 [GitHub](https://github.com/AnanyaDasgupta)

---

## 📄 License

This project is licensed under the **MIT License** — free to use and modify.

---

## 🙋 FAQ

**Q: Do I need to know Python to use this?**  
No! You only need Python installed if you're running it without Docker.

**Q: What if I see a firewall/port error?**  
Make sure port 5000 is open on your machine and not used by another service.

**Q: What’s Docker, in simple terms?**  
Docker lets you “package” your app with everything it needs so it can run anywhere, on any computer — no setup headaches!

---

Enjoy the service, and feel free to reach out if you have any questions or want to contribute!
