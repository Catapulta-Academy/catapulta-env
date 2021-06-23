FROM ubuntu:20.04
ENV TZ=America/Mexico_City
ENV DEBIAN_FRONTEND=noninteractive 
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && apt-get -y update
RUN apt install -y curl 
RUN apt install -y sl 
RUN apt install -y zip unzip
RUN apt install -y nano
RUN apt install -y wget

RUN mkdir -p /root/workspace
WORKDIR /root

RUN apt-get update && apt-get install -y --no-install-recommends locales
RUN curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh
RUN apt install -y nodejs
RUN apt install -y build-essential
RUN apt-get install -y inotify-tools
RUN wget https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb 
RUN dpkg -i erlang-solutions_2.0_all.deb
RUN apt-get update
RUN apt-get install -y esl-erlang
RUN apt-get install -y elixir
RUN mix local.hex --force
RUN mix archive.install hex phx_new 1.5.9

WORKDIR /root/workspace

ENV LANG=en_US.UTF-8 
RUN echo $LANG UTF-8 > /etc/locale.gen 
RUN locale-gen 
RUN update-locale LANG=$LANG