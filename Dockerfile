ARG DEBIAN_VERSION=buster-slim
ARG SOURCE_COMMIT
ARG VERSION=latest

FROM debian:$DEBIAN_VERSION

RUN apt update && \
    apt install -y proftpd && \
    apt clean autoclean && \
    apt autoremove --yes && \
    rm -rf /var/lib/{apt,dpkg,cache,log} && \
    chown ftp /run /run/proftpd && \
    mkdir /ftp

COPY proftpd.conf /etc/proftpd/proftpd.conf

EXPOSE 20 21

USER ftp

CMD ["proftpd", "--nodaemon", "-c", "/etc/proftpd/proftpd.conf"]

LABEL org.label-schema.name="proftpd service" \
      org.label-schema.description="Simple alpine based unprivileged proftpd service built for many architectures" \
      org.label-schema.url="https://hub.docker.com/repository/docker/mesaguy/proftpd/" \
      org.label-schema.vcs-ref=$SOURCE_COMMIT \
      org.label-schema.vcs-url="https://github.com/mesaguy/docker-proftpd" \
      org.label-schema.vendor="Mesaguy" \
      org.label-schema.version=$VERSION \
      org.label-schema.schema-version="1.0"
