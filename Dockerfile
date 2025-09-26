FROM python:3.11.9-slim

WORKDIR /app

COPY requirements.txt . 
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN mkdir -p /app/data && chmod -R 777 /app/data


RUN chmod +x /app/meomundep.py || true

VOLUME /app/data

ENTRYPOINT ["python", "/app/meomundep.py"]
