FROM ubuntu:latest

ENV TZ=Asia/Tokyo

RUN apt-get update && \
    apt-get install -y time vim tree git curl build-essential

RUN apt-get update && \
    apt-get install -y openssh-server && \
    mkdir /var/run/sshd && \
    echo 'root:root' | chpasswd

RUN mkdir -p cpp/HelloWorld

WORKDIR /cpp/HelloWorld

COPY ./HelloWorld.cpp /cpp/HelloWorld

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
