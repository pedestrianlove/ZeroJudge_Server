FROM tomcat:latest

ARG DB_PASS

COPY . /app
WORKDIR /app

RUN apt update -y && apt upgrade -y && apt install -y python3 python3-pip git

RUN pip3 install -r requirements.txt
RUN python3 /app/setup.py install --dbpass $DB_PASS
