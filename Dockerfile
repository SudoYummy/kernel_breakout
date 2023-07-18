FROM ubuntu:latest
RUN apt update
RUN apt install linux-headers-$(uname -r) -y
RUN apt install openssl libssl-dev kmod build-essential -y
COPY . /app/
WORKDIR /app/
RUN chmod 777 kernel-insert.sh
RUN make
ENTRYPOINT [ "./kernel-insert.sh" ]