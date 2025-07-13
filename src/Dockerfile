FROM scratch AS ctx
COPY scripts /

FROM scratch AS utils
COPY utils /

FROM docker.io/library/ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN \
  --mount=type=bind,from=ctx,source=/,target=/ctx \
  --mount=type=bind,from=utils,source=/,target=/tmp/utils/bin \
  PATH=/tmp/utils/bin:$PATH bash /ctx/install.sh
