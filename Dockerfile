FROM ghcr.io/cyb3r-jak3/html5validator:pypi-alpine@sha256:f5785c1120f3c0f8f8c5084e47c6272eba8d307a6325db112e48034b44a0bd15

COPY entrypoint.sh /entrypoint.sh
RUN apk add --update --no-cache bash git && rm -rf /var/cache/apk/*

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]