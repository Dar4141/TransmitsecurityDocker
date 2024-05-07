FROM openjdk:11

ARG TS_IMAGE

ARG TS_VERSION

RUN mkdir /opt/auth-control-standalone

COPY ./${TS_VERSION}/${TS_IMAGE} /tmp

WORKDIR /tmp

RUN dpkg -i ${TS_IMAGE}

RUN rm -Rf /tmp/*

WORKDIR /opt/auth-control-standalone

COPY ./application.conf ./config

COPY ./logback.xml ./config

COPY ./entrypoint.sh ./bin

RUN chmod +x ./bin/entrypoint.sh
