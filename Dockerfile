FROM alpine:3
RUN apk add --update --no-cache ca-certificates \
  openssh-client \
  sshpass

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]