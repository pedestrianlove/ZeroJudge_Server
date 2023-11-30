FROM tomcat:latest

ARG DB_PASS


RUN apt update -y && apt upgrade -y && apt install -y python3 python3-pip git ant

COPY . /app
WORKDIR /app
RUN pip3 install -r requirements.txt
RUN python3 /app/setup.py install --dbpass $DB_PASS
