FROM ubuntu:20.04

RUN apt-get update && apt-get upgrade -y
RUN apt-get install sudo git python3 -y

RUN useradd test
RUN echo 'test:test' | chpasswd
RUN usermod -aG sudo test
RUN mkdir /home/test

RUN git clone https://github.com/BeLeap/dotfiles /home/test/dotfiles
RUN chown test /home/test/dotfiles

USER test
