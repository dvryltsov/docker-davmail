FROM openjdk:8-jre-alpine

ENV DAVMAIL_VERSION=6.0.0
ENV DAVMAIL_BUILD=3375

ADD https://downloads.sourceforge.net/project/davmail/davmail/${DAVMAIL_VERSION}/davmail-${DAVMAIL_VERSION}-${DAVMAIL_BUILD}.zip /tmp/davmail.zip

RUN adduser davmail -D && \
  mkdir /usr/local/davmail && \
  unzip -q /tmp/davmail.zip -d /usr/local/davmail && \
  rm /tmp/davmail.zip

VOLUME        /etc/davmail
VOLUME        /var/log/davmail

EXPOSE        1080
EXPOSE        1143
EXPOSE        1389
EXPOSE        1110
EXPOSE        1025
WORKDIR       /usr/local/davmail
COPY davmail.properties /etc/davmail/davmail.properties

USER davmail

CMD ["/usr/local/davmail/davmail", "/etc/davmail/davmail.properties"]
