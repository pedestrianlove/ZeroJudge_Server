FROM tomcat:latest

ARG DB_PASS


RUN apt-get update -y && apt-get upgrade -y && apt-get install -y python3 python3-pip git ant

RUN mkdir -p /server
RUN git clone https://github.com/pedestrianlove/ZeroJudge_Server_src.git /server
WORKDIR /server
RUN ant run

COPY . /app
WORKDIR /app
RUN pip3 install -r requirements.txt
RUN python3 /app/setup.py install --dbpass $DB_PASS
