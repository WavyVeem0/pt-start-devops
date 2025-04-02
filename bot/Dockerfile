FROM ubuntu:latest
#WORKDIR ./app
COPY ./bot .
COPY data.env ./data.env
RUN apt update
RUN apt install python3 python3-pip -y
RUN pip install python-telegram-bot --upgrade --break-system-packages
RUN pip install "python-telegram-bot[job-queue]" --break-system-packages
RUN pip install dotenv paramiko pytz psycopg2-binary  --break-system-packages
CMD ["python3", "bot.py"]
