FROM alpine:latest

RUN apk update \
    && apk upgrade \
    && apk add --no-cache --update \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ \
    bash emacs-nox ruby \
    && gem install --no-ri --no-rdoc hiera-eyaml

#ENTRYPOINT ["eyaml"]
ENTRYPOINT ["/usr/local/bin/secure_env.sh"]