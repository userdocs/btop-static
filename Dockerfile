FROM alpine:edge@sha256:115729ec5cb049ba6359c3ab005ac742012d92bbaa5b8bc1a878f1e8f62c0cb8 AS builder

ARG ARCH="x86_64"
ARG REPO="userdocs/btop-static"

# Add metadata labels for easy parsing
LABEL org.opencontainers.image.base.name="alpine:edge" \
      org.opencontainers.image.base.id="alpine" \
      org.opencontainers.image.base.codename="edge" \
      org.opencontainers.image.title="btop-crossbuilds" \
      org.opencontainers.image.description="statically linked btop binaries built on alpine linux" \
      org.opencontainers.image.source="https://github.com/userdocs/btop-static" \
      org.opencontainers.image.url="https://github.com/userdocs/btop-static" \
      org.opencontainers.image.documentation="https://github.com/userdocs/btop-static/blob/main/README.md" \
      org.opencontainers.image.licenses="MIT" \
      org.opencontainers.image.vendor="userdocs"

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
