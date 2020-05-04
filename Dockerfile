FROM ubuntu:20.04

RUN sed -i 's/archive.ubuntu.com/ftp.daum.net/g' /etc/apt/sources.list

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get upgrade -y
RUN ln -fs /usr/share/zoneinfo/Asia/Seoul /etc/localtime
RUN apt-get install sudo python3 tzdata -y
RUN dpkg-reconfigure --frontend noninteractive tzdata

RUN useradd test
RUN echo "test:test" | chpasswd
RUN usermod -aG sudo test
RUN mkdir /home/test
RUN chown test /home/test

USER test

COPY / /home/test/dotfiles

ENV DEBIAN_FRONTEND=noninteractive
CMD cd ~/dotfiles && python3 install.py --env=dev
