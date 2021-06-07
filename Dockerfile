FROM python:3-alpine

RUN apk add --no-cache \
    musl-dev \ 
    libffi-dev \
    openssl-dev \
    python3-dev \
    gcc \
    libxml2 \
    libxslt-dev \
    rust cargo \
    jq

RUN pip3 install --no-cache-dir urlwatch
RUN pip3 cache purge 

RUN echo "urlwatch --urls /config/urls.yaml --config /config/urlwatch.yaml" >> /etc/periodic/15min/urlwatch.sh
RUN chmod +x /etc/periodic/15min/urlwatch.sh
RUN mkdir -p /config 

VOLUME /config

ENTRYPOINT ["crond", "-l", "2", "-f"]