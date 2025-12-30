FROM python:3.8.5-slim-buster

WORKDIR /app

# Install system deps if needed (optional, for matplotlib, etc.)
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . /app

ENV PORT=8080

CMD ["python3", "flask_api/main.py"]
