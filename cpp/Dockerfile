FROM ubuntu:latest

ENV TZ=Asia/Tokyo

RUN apt-get update && \
    apt-get install -y tar time vim tree git curl build-essential

RUN apt-get update && \
    apt-get install -y openssh-server && \
    mkdir /var/run/sshd && \
    echo 'root:root' | chpasswd

RUN mkdir -p cpp/HelloWorld

WORKDIR /cpp/HelloWorld

COPY ./HelloWorld.cpp /cpp/HelloWorld

# Add user "dev" and give sudo
RUN useradd -m -s /bin/bash dev && \
    echo "dev ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Fix SSH config
# Unable password and able public key
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config && \
    sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/' /etc/ssh/sshd_config && \
    echo 'AllowUsers dev' >> /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
