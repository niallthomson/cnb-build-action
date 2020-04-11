FROM docker

RUN mkdir /pack
RUN mkdir /source

COPY entrypoint.sh /usr/local/bin

WORKDIR /pack

RUN wget https://github.com/buildpack/pack/releases/download/v0.9.0/pack-v0.9.0-linux.tgz \
      && tar -xvf pack-v0.9.0-linux.tgz \
      && chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT entrypoint.sh
CMD []