FROM python:3.10

WORKDIR /app

COPY requirements.txt /app/

RUN pip install --no-cache-dir -r requirements.txt

COPY script /app/script

EXPOSE 8000

# Lệnh khởi động FastAPI server
CMD ["uvicorn", "script.main:app", "--host", "0.0.0.0", "--port", "8000"]
