FROM docker

RUN mkdir /pack
RUN mkdir /source

COPY entrypoint.sh /usr/local/bin

WORKDIR /pack

RUN wget https://github.com/buildpack/pack/releases/download/v0.9.0/pack-v0.9.0-linux.tgz
RUN ls -la
RUN tar -xvf pack-v0.9.0-linux.tgz

ENTRYPOINT entrypoint.sh
CMD []