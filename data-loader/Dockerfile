
FROM python:3.13-slim

WORKDIR /app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY services/data_loader/ ./services/data_loader/

CMD ["uvicorn", "services.data_loader.main:app", "--host", "0.0.0.0", "--port", "8080"]
