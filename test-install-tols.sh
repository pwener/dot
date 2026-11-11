#!/bin/bash
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")"

docker run --rm -it \
  -v "$PWD":/dot \
  -w /dot \
  debian:13 \
  bash install-tools.sh
