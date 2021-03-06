FROM nvidia/opencl:runtime-ubuntu18.04

MAINTAINER g-unit123 

ENV DEBIAN_FRONTEND noninteractive

ADD https://download.foldingathome.org/releases/public/release/fahclient/debian-stable-64bit/v7.6/fahclient_7.6.13_amd64.deb /tmp/

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install ocl-icd-opencl-dev

RUN dpkg -i /tmp/fahclient_7.6.13_amd64.deb || exit 0
RUN rm /tmp/fahclient_7.6.13_amd64.deb

WORKDIR /root
VOLUME /root

EXPOSE 7396

CMD FAHClient --user=g-unit123 --team=240111 --gpu=true --smp=true --priority=low --cpu-usage=90 --web-allow=0/0 --allow=0/0 --gpu-usage=100
