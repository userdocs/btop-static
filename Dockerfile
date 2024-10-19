FROM alpine:latest AS builder

ARG PLATFORM
ARG ARCH
ARG REPO

RUN apk update \
	&& apk upgrade \
	&& apk add curl sudo \
	&& adduser -Ds /bin/bash -u 1000 username \
	&& printf '%s' 'username ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/github

ADD curl -sLo- "https://github.com/${REPO}/releases/latest/download/${ARCH}.tar.xz" | tar -xJf - -C /usr/local/

USER username

WORKDIR /home/username

ENTRYPOINT [ "/usr/local/bin/btop" ]
