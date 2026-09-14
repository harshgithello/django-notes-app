FROM python:3.12-slim

WORKDIR /app/backend

COPY requirements.txt .

RUN apt-get update \
    && apt-get install -y --no-install-recommends gcc default-libmysqlclient-dev pkg-config curl \
    && pip install --no-cache-dir setuptools mysqlclient \
    && pip install --no-cache-dir -r requirements.txt \
    && rm -rf /var/lib/apt/lists/*

COPY . .

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
