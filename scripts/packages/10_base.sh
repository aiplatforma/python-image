#!/bin/bash

set -ouex pipefail

ln -fs /usr/share/zoneinfo/Europe/Belgrade /etc/localtime

apt-install \
  curl \
  git \
  build-essential \
  jq
