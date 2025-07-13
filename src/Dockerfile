FROM scratch AS ctx
COPY scripts /

FROM docker.io/library/ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN \
  --mount=type=bind,from=ctx,source=/,target=/ctx \
  bash /ctx/install.sh
