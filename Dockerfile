FROM ubuntu:trusty
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y default-jre-headless wget python2.7 python-pip
RUN pip install requests pyyaml
RUN adduser --gecos "Glowstone Server" --disabled-password glowstone
USER glowstone
WORKDIR /home/glowstone
ADD run.py /home/glowstone/
ADD glowstone.yml.dist /home/glowstone/
RUN wget https://bamboo.gserv.me/browse/GSPP-SRV/latest/artifact/shared/Version-Independent-Server-JAR/glowstone.jar -O /home/glowstone/glowstone.jar
CMD /usr/bin/python run.py
EXPOSE 25565

