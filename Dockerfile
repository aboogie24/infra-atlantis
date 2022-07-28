FROM ghcr.io/runatlantis/atlantis:v0.19.6 


# Bust the cache before running non-repeatable commands
ARG version

# Install latest system patches
RUN set -ex \
    && apk update \
    && apk upgrade --no-cache \
    && rm -rf /var/cache/apk/*

# Install Python3 for Lambdas
RUN apk add --no-cache python3

# copy docker entrypoint
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

LABEL name="atlantis"
LABEL version=$version

EXPOSE 4141