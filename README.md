# docker-urlwatch

urlwatch is a tool to monitor URLs and notify you of changes. 

docker-compose example:
```
version: "2.1"
services:
  urlwatch:
    build:
        context: ./
    container_name: "urlwatch"
    volumes:
        - /var/docker/urlwatch/config:/config:ro
    restart: unless-stopped
```
