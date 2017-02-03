FROM alpine:latest

RUN apk add --update --no-cache ruby \
    && gem install --no-ri --no-rdoc hiera-eyaml

ENTRYPOINT ["eyaml"]