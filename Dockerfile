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
