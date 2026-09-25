FROM --platform=linux/arm64 python:3.11-slim-bookworm

WORKDIR /app

ENV PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1

RUN apt-get update \
    && apt-get install -y --no-install-recommends sudo \
    && rm -rf /var/lib/apt/lists/*

COPY ai.py ./
COPY lib ./lib
COPY fix_freq_*.sh ./

RUN pip install --no-cache-dir Flask

EXPOSE 8080

ENTRYPOINT ["python3", "ai.py"]

