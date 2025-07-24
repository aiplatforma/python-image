#!/bin/bash

set -ouex pipefail

curl -Ls https://micro.mamba.pm/api/micromamba/linux-64/latest | tar -xvj bin/micromamba --strip-components=1 -C /usr/local/bin
chmod +x /usr/local/bin/micromamba
