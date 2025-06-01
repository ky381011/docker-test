From ubuntu:latest

ENV TZ=Asia/Tokyo

RUN apt-get update && \
    apt-get install -y time vim tree git curl

RUN apt-get update && \
    apt-get install -y builid-essential

RUN mkdir C++

WORKDIR /C++
