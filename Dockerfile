FROM docker

RUN mkdir /pack
RUN mkdir /source

ADD entrypoint.sh /entrypoint.sh

WORKDIR /pack

RUN wget https://github.com/buildpack/pack/releases/download/v0.9.0/pack-v0.9.0-linux.tgz \
      && tar -xvf pack-v0.9.0-linux.tgz \
      && chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD []