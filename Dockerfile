# get the base image
FROM ubuntu:14.04
MAINTAINER Praveen Samudrala "oceanspraveen@gmail.com"  

# first run update
RUN apt-get -y update

# get some packages
RUN apt-get -y install build-essential
RUN apt-get -y install git
RUN apt-get -y install emacs
RUN apt-get -y install sudo
RUN apt-get -y install curl

# install apache
RUN apt-get -y install apache2

EXPOSE 80 8080 8081 8082 8083

# git clone the repo
RUN git clone https://github.com/Shopify/dashing.git

# run the scripts now. This will be our entry point
RUN mkdir /scripts
ADD startup.pl /scripts/
RUN chmod 775 /scripts/startup.pl


