FROM alpine:3
RUN apk add --update --no-cache ca-certificates \
  openssh-client \
  sshpass

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT [ "entrypoint.sh" ]