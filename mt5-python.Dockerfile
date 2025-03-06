# Sử dụng Python 3.11 làm base image
FROM python:3.10

# Đặt thư mục làm việc
WORKDIR /app

# Copy file requirements.txt trước để cache dependencies
COPY requirements.txt /app/

# Cài đặt các thư viện Python, bao gồm mt5linux
RUN pip install --no-cache-dir -r requirements.txt

# Copy toàn bộ thư mục script vào container
COPY script /app/script

# Mở cổng FastAPI
EXPOSE 8000

# Lệnh khởi động FastAPI server
CMD ["uvicorn", "script.main:app", "--host", "0.0.0.0", "--port", "8000"]
