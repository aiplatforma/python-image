#!/bin/bash

set -ouex pipefail

find /ctx/packages -type f -name "*.sh" | sort | while read -r script
do
  echo "running: $script"
  bash $script
done
