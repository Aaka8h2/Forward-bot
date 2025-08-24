FROM python:3.12-slim-bookworm

WORKDIR /VJ-Forward-Bot

# First, copy only the requirements file.
# This improves caching and build speed.
COPY requirements.txt .

# Now, install the dependencies from the requirements file.
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    && rm -rf /var/lib/apt/lists/* \
    && pip3 install -U pip && pip3 install -U -r requirements.txt

# Finally, copy the rest of your application code.
COPY . .

CMD ["python3", "main.py"]
