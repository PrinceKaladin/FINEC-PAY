FROM python:3.9-slim

# Устанавливаем рабочую директорию
WORKDIR /app

# Устанавливаем зависимости системы
RUN apt-get update && apt-get install -y \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Копируем файлы проекта в контейнер
# Предполагается, что папка FINAC PAY находится на том же уровне, что и Dockerfile
COPY ./FINAC PAY /app

# Устанавливаем зависимости Python
RUN pip install --no-cache-dir -r requirements.txt

# Устанавливаем переменные окружения
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=5000
ENV PYTHONUNBUFFERED=1

# Открываем порт для приложения
EXPOSE 5000

# Команда для запуска приложения
CMD ["sh", "-c", "python app.py & python bot.py"]
