FROM python:3.11.9-slim

WORKDIR /app

COPY . .

RUN pip install --no-cache-dir -r requirements.txt && \
    mkdir -p /app/data && \
    chmod +x /app/run.sh

VOLUME /app/data

ENTRYPOINT ["/app/run.sh"]
