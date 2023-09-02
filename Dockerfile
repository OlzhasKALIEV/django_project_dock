# Указываем базовый образ
FROM python:3.11.4

# Копируем requirements.txt в контекст сборки Docker-образа
COPY requirements.txt /django_project_dock/requirements.txt

# Устанавливаем зависимости
RUN pip install -r /django_project_dock/requirements.txt

# Копируем остальные файлы проекта в контейнер
COPY . /django_project_dock

# Устанавливаем рабочую директорию
WORKDIR /django_project_dock

# Опционально: указываем порт, который будет использоваться при запуске контейнера
EXPOSE 8000

# Опционально: указываем команду, которая будет выполнена при запуске контейнера
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
