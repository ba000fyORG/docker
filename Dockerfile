
# "Боевой" многослойный Dockerfile с множеством зависимостей и потенциальных уязвимостей

FROM python:3.10-slim as base

# Устанавливаем системные зависимости
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    wget \
    netcat-openbsd \
    openssh-client \
    cron \
    vim \
    nano \
    telnet \
    gnupg \
    build-essential \
    libssl-dev \
    libffi-dev \
    libxml2-dev \
    libxslt1-dev \
    zlib1g-dev \
    libjpeg-dev \
    libpq-dev \
    nmap \
    unzip \
    liblapack-dev \
    gfortran \
    && rm -rf /var/lib/apt/lists/*

# Устанавливаем Python-зависимости
COPY requirements.txt /tmp/
RUN pip install --no-cache-dir -r /tmp/requirements.txt

# Копируем исходники
COPY . /app
WORKDIR /app

# Без HEALTHCHECK и без смены пользователя (для демонстрации плохой практики)
EXPOSE 5000
CMD ["python", "main.py"]
