FROM cyb3rjak3/html5validator

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-ref=$VCS_REF

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]