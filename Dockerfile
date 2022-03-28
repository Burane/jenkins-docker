FROM jenkins/jenkins:latest-jdk11
USER root
RUN apt-get -y install apt-transport-https ca-certificates curl software-properties-common && \
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    add-apt-repository "deb [arch=arm64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
    apt-get update && \
    apt-cache policy docker-ce && \
    apt-get -y install docker-ce && \
    usermod -aG docker ${USER} && \
    apt install python3-pip && \
    pip3 install docker-compose
    
