## google-cloud-profiler==4.1.0 is not compatible with python:3.13 or python:3.11-slim
# FROM python:3.13
FROM python:3.11
# Prevent Python from writing .pyc files and buffering stdout
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
# Set working directory
WORKDIR /app
# Install system dependencies (optional, but common)
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*
# Copy dependency file first (better caching)
COPY requirements.txt .
# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt gunicorn
# Copy the rest of the app
COPY . .
ENV PORT=8080
## JSON arguments recommended for CMD to prevent unintended behavior related to OS signals
# CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 main:app
CMD ["sh", "-c", "exec gunicorn --bind :$PORT --workers 1 --threads 8 main:app"]
