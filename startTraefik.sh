#!/bin/bash

VERSION=1.0.0

docker pull mahertf/openeats-traefik:${VERSION}

docker run -d \
	--restart unless-stopped \
	-p 8080:8080 \
	-p 443:443 \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-e TZ=Europe/Berlin \
	--mount type=volume,src=certs,dst=/mnt/certs,readonly \
	--name traefik \
	mahertf/openeats-traefik:${VERSION}
