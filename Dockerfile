FROM python:3.14-slim

RUN apt update
RUN apt upgrade -y
RUN apt install build-essential gcc libssl-dev libffi-dev python3-dev -y

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Use an entrypoint script to allow for variable substitution
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]