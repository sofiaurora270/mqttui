FROM python:3.9-slim

RUN sudo apt update
RUN sudo apt upgrade -y
RUN sudo apt install build-essential gcc libssl-dev libffi-dev python3-dev -y

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Use an entrypoint script to allow for variable substitution
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]