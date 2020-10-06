FROM openjdk:alpine
MAINTAINER Daan Kemper <info@daankemper.nl>

USER root
WORKDIR /minecraft

VOLUME ["/minecraft/world"]
EXPOSE 25565

RUN apk update && apk add curl bash

# Download and unzip minecraft files
RUN mkdir -p /minecraft/world

RUN curl -LO https://media.forgecdn.net/files/2990/439/atm3-remix-server-full.zip
RUN unzip atm3-remix-server-full.zip && mv ATM3/* ./
RUN rmdir ATM3 && rm atm3-remix-server-full.zip


# Accept EULA
RUN echo "# EULA accepted on $(date)" > /minecraft/eula.txt && \
    echo "eula=TRUE" >> eula.txt

# Startup script
CMD ["/bin/bash", "/minecraft/ServerStart.sh"] 
