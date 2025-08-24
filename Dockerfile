FROM python:3.12-slim-bookworm

WORKDIR /VJ-Forward-Bot

COPY requirements.txt .

# Install build tools and other packages in a single command
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    build-essential \
    && rm -rf /var/lib/apt/lists/* \
    && pip3 install -U pip && pip3 install -U -r requirements.txt

COPY . .

CMD ["python3", "main.py"]
