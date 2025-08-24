FROM python:3.10.8-slim-buster

# Change to a more modern base image to avoid apt errors
# FROM python:3.12-slim-bookworm

WORKDIR /VJ-Forward-Bot

# Install git and pip requirements in a single layer to reduce image size
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    && rm -rf /var/lib/apt/lists/* \
    && pip3 install -U pip \
    && pip3 install -U -r requirements.txt

# Copy all project files into the working directory
COPY . .

# Run your bot as the main process.
# Remove gunicorn if your bot doesn't need a web interface.
CMD ["python3", "main.py"]
