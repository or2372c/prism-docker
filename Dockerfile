# Pull base image.
FROM jlesage/baseimage-gui:ubuntu-18.04

RUN apt-get update

# Install Java https://docs.papermc.io/misc/java-install
RUN apt-get install -y wget software-properties-common ca-certificates apt-transport-https gnupg curl && \
    wget -O- -q https://apt.corretto.aws/corretto.key | apt-key add - && \
    add-apt-repository -y 'deb https://apt.corretto.aws stable main' && \
    apt-get update && \
    apt-get install -y java-17-amazon-corretto-jdk

# Install multimc dependices.
RUN apt-get install -y libqt5core5a libqt5network5 libqt5concurrent5 libqt5gui5 libqt5xml5 desktop-file-utils
#MultiMC. Download, extract and allow execute.
VOLUME ["/config/multimc/instances"]
VOLUME ["/config"]
WORKDIR /multimc
RUN wget -O- -q --show-progress --progress=dot:mega "https://files.multimc.org/downloads/mmc-stable-lin64.tar.gz" | tar xvz --transform='s,MultiMC/,,' && \
    chmod +x MultiMC && \
    ls -l

# Set the name of the application.
ENV APP_NAME="MultiMC - Minecraft"

# Copy the start script.
COPY startapp.sh /startapp.sh
