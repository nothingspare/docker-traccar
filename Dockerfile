FROM openjdk:8-jre

ENV TRACCAR_VERSION 4.0

WORKDIR /opt/traccar

RUN set -ex && \
    curl -LSso /tmp/traccar.zip https://github.com/traccar/traccar/releases/download/v$TRACCAR_VERSION/traccar-other-$TRACCAR_VERSION.zip && \
    unzip -qo /tmp/traccar.zip -d /opt/traccar && \
    rm /tmp/traccar.zip

ADD ./traccar.xml /opt/traccar/conf/traccar.xml

ENTRYPOINT ["java", "-Xms512m", "-Xmx512m", "-Djava.net.preferIPv4Stack=true"]

CMD ["-jar", "tracker-server.jar", "conf/traccar.xml"]
