# Pull base image.
FROM jlesage/baseimage-gui:ubuntu-18.04

RUN apt-get update

# Install Java https://docs.papermc.io/misc/java-install
RUN apt-get install -y wget software-properties-common ca-certificates apt-transport-https gnupg curl && \
    wget -O- -q https://apt.corretto.aws/corretto.key | apt-key add - && \
    add-apt-repository -y 'deb https://apt.corretto.aws stable main' && \
    apt-get update && \
    apt-get install -y java-21-amazon-corretto-jdk

# Install multimc dependices.
RUN apt-get install -y libqt5core5a libqt5network5 libqt5concurrent5 libqt5gui5 libqt5xml5 desktop-file-utils
#MultiMC. Download, extract and allow execute.
VOLUME ["/config/prism/instances"]
VOLUME ["/config"]
WORKDIR /prism
RUN wget -O- -q --show-progress --progress=dot:mega "https://github.com/PrismLauncher/PrismLauncher/releases/download/9.4/PrismLauncher-Linux-Qt6-Portable-9.4.tar.gz" | tar xvz --transform='s,Prism/,,' && \
    chmod +x Prism && \
    ls -l

# Set the name of the application.
ENV APP_NAME="Prism - Minecraft"

# Copy the start script.
COPY startapp.sh /startapp.sh
