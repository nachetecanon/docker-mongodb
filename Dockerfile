FROM alpine
MAINTAINER Nacho Cañón <nachete.canon@gmail.com>

ENV MONGO_VERSION=3.2
# Install cURL, tar, etc
RUN apk --update add bash ca-certificates tar wget openssl unzip  alpine-sdk  \
    openssl-dev mongodb-org=$MONGO_VERSION \
    mongodb-org-server=$MONGO_VERSION \
    mongodb-org-shell=$MONGO_VERSION \
    mongodb-org-mongos=$MONGO_VERSION \
    mongodb-org-tools=$MONGO_VERSION


# some cleanup
RUN apk del alpine-sdk  openssl-dev \
    && rm -fR /tmp/* 2> /dev/null


# Create the MongoDB data directory
RUN mkdir -p /data/db

# Expose port 27017 from the container to the host
EXPOSE 27017

# Set usr/bin/mongod as the dockerized entry-point application
ENTRYPOINT ["/usr/bin/mongod"]
