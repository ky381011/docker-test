FROM ubuntu:latest

ENV TZ=Asia/Tokyo

RUN apt-get update && \
    apt-get install -y time vim tree git curl

RUN apt-get update && \
    apt-get install -y build-essential

RUN mkdir CPP/HelloWorld

WORKDIR /CPP/HelloWorld

COPY ./HelloWorld.cpp /CPP/HelloWorld
