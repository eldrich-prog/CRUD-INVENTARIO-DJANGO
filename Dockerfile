# Usa una imagen base de Alpine con Python preinstalado
FROM python:3.8-slim

# Establece el directorio de trabajo en /app
WORKDIR /app

# Copia el archivo de requerimientos e instala las dependencias
COPY dependencias.txt .

# Instala las dependencias
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r dependencias.txt

# Copia el código de la aplicación al directorio de trabajo
COPY . .

# Expone el puerto 8000
EXPOSE 8000

WORKDIR /app/sistema

# Comando para iniciar el servidor Django
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
