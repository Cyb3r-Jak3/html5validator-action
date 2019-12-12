FROM cyb3rjak3/html5validator

ARG BUILD_DATE
ARG VCS_REF

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-ref=$VCS_REF

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]