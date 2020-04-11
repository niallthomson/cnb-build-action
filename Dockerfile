# Container image that runs your code
FROM alpine:3.10

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

RUN apk update && apk add --no-cache docker-cli

RUN wget https://github.com/buildpack/pack/releases/download/v0.9.0/pack-v0.9.0-linux.tgz \
      && tar -xvf pack-v0.9.0-linux.tgz \
      && mv pack /usr/local/bin/pack

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]