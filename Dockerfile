FROM ghcr.io/cyb3r-jak3/html5validator:source-alpine 

COPY entrypoint.sh /entrypoint.sh
RUN apk add --update --no-cache bash git=2.32.1-r0 --repository http://dl-cdn.alpinelinux.org/alpine/v3.14/main/ && rm -rf /var/cache/apk/*

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]