# Start from a minimal Python 3.12 Alpine image
FROM python:alpine

# Set working directory
WORKDIR /app

# Copy the app files into the image
COPY . .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Create a non-root user
RUN adduser -D appuser

# Use the non-root user
USER appuser

# Expose the port
EXPOSE 5000

# Run the application
CMD ["python", "SimpleTimeService.py"]
