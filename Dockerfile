FROM alpine:latest AS builder

ARG PLATFORM
ARG ARCH="x86_64-linux-musl"
ARG REPO="userdocs/btop-crossbuilds"

RUN apk update \
	&& apk upgrade \
	&& apk add curl sudo \
	&& adduser -Ds /bin/bash -u 1000 username \
	&& printf '%s' 'username ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/github

ADD https://github.com/${REPO}/releases/latest/download/${ARCH}.tar.xz /usr/local/

USER username

WORKDIR /home/username

ENTRYPOINT [ "/usr/local/bin/btop" ]
