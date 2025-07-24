#!/bin/bash

set -ouex pipefail

curl -Ls https://micro.mamba.pm/api/micromamba/linux-64/latest | tar -xvj -C /usr/local/bin --strip-components=1 bin/micromamba
chmod +x /usr/local/bin/micromamba
