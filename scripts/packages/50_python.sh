#!/bin/bash

set -ouex pipefail

apt-get update
apt-get install -y \
  python3 \
  python3-pip \
  python-is-python3
