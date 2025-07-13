#!/bin/bash

set -ouex pipefail

PKG_VER="0.18.0"
TGZ_URL="https://github.com/asdf-vm/asdf/releases/download/v${PKG_VER}/asdf-v${PKG_VER}-linux-amd64.tar.gz"

TGZ_FILE="$(mktemp)"

curl -o $TGZ_FILE -L $TGZ_URL

TGZ_DIR="$(mktemp -d)"

tar -xf $TGZ_FILE -C $TGZ_DIR

mv $TGZ_DIR/asdf /usr/local/bin
chmod 0755 /usr/local/bin

asdf plugin add python https://github.com/asdf-community/asdf-python.git
