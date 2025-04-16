# Use a minimal Python image
FROM python:3.12-slim

# Set environment variables to prevent .pyc files and ensure stdout/stderr are unbuffered
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# Set working directory
WORKDIR /app

# Install pip dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Create non-root user and switch to it
RUN useradd --create-home appuser
USER appuser

# Expose the port Flask runs on
EXPOSE 5000

# Run the Flask app
CMD ["python", "SimpleTimeService.py"]
