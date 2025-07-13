#!/bin/bash

set -ouex pipefail

ln -fs /usr/share/zoneinfo/Europe/Belgrade /etc/localtime

apt-get update
apt-get install -y \
  curl \
  git \
  build-essential \
  jq
