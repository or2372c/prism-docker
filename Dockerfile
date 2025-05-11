# Pull base image.
FROM jlesage/baseimage-gui:ubuntu-20.04

RUN apt-get update

# Install Java https://docs.papermc.io/misc/java-install
RUN apt-get install -y wget software-properties-common ca-certificates apt-transport-https gnupg curl && \
    wget -O- -q https://apt.corretto.aws/corretto.key | apt-key add - && \
    add-apt-repository -y 'deb https://apt.corretto.aws stable main' && \
    apt-get update && \
    apt-get install -y java-21-amazon-corretto-jdk

# Install multimc dependices.
RUN apt-get install -y libqt5core5a libqt5network5 libqt5concurrent5 libqt5gui5 libqt5xml5 desktop-file-utils
# install prism
#RUN wget -qO - 'https://proget.makedeb.org/debian-feeds/prebuilt-mpr.pub' | gpg --dearmor | tee /usr/share/keyrings/prebuilt-mpr-archive-keyring.gpg 1> /dev/null && \
#    echo "deb [arch=all,$(dpkg --print-architecture) signed-by=/usr/share/keyrings/prebuilt-mpr-archive-keyring.gpg] https://proget.makedeb.org prebuilt-mpr $(lsb_release -cs)" | tee /etc/apt/sources.list.d/prebuilt-mpr.list && \
#    apt-get update
    
VOLUME ["/config/prism/instances"]
VOLUME ["/config"]
#RUN apt-get install -y prismlauncher

#RUN curl -LO https://github.com/PrismLauncher/PrismLauncher/releases/download/9.4/PrismLauncher-Linux-x86_64.AppImage
#RUN chmod +x ./PrismLauncher-Linux-x86_64.AppImage

#MultiMC. Download, extract and allow execute.
#VOLUME ["/config/prism/instances"]
#VOLUME ["/config"]
WORKDIR /prism
RUN wget -O- -q --show-progress --progress=dot:mega "https://github.com/PrismLauncher/PrismLauncher/releases/download/9.4/PrismLauncher-Linux-Qt6-Portable-9.4.tar.gz" | tar xvz --transform='s,PrismLauncher/,,' && \
    chmod +x PrismLauncher && \
    ls -l

# Set the name of the application.
ENV APP_NAME="Prism - Minecraft"

# Copy the start script.
COPY startapp.sh /startapp.sh
