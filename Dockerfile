FROM ghcr.io/cyb3r-jak3/html5validator:pypi-alpine@sha256:54f3750b78853934adde9bf12d3a1248adddf7a234d3c065574f19dcd941d29f

COPY entrypoint.sh /entrypoint.sh
RUN apk add --update --no-cache bash git && rm -rf /var/cache/apk/*

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]