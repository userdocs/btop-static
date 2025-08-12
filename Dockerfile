FROM alpine:latest@sha256:4bcff63911fcb4448bd4fdacec207030997caf25e9bea4045fa6c8c44de311d1 AS builder

ARG ARCH="x86_64"
ARG REPO="userdocs/btop-static"

RUN apk update \
	&& apk upgrade \
	&& apk add sudo \
	&& adduser -Ds /bin/bash -u 1000 username \
	&& printf '%s' 'username ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/github \
	&& if [ "${ARCH}" = "armv6" ] || [ "${ARCH}" = "armv7l" ]; then \
		wget -qO- "https://github.com/userdocs/btop-static/releases/latest/download/${ARCH}-linux-musleabihf.tar.xz" | tar xfJ - -C /usr/local; \
	else \
		wget -qO- "https://github.com/userdocs/btop-static/releases/latest/download/${ARCH}-linux-musl.tar.xz" | tar xfJ - -C /usr/local; \
	fi

USER username

WORKDIR /home/username
