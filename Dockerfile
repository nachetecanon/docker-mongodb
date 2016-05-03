FROM mvertes/alpine-mongo
MAINTAINER Nacho Cañón <nachete.canon@gmail.com>

ENV MONGO_VERSION=3.2
# Install cURL, tar, etc
RUN apk --update add bash ca-certificates tar wget openssl unzip  alpine-sdk openssl-dev


# some cleanup
RUN apk del alpine-sdk  openssl-dev \
    && rm -fR /tmp/* 2> /dev/null


# Expose port 27017 from the container to the host
EXPOSE 27017

# Set usr/bin/mongod as the dockerized entry-point application
ENTRYPOINT ["/usr/bin/mongod"]
