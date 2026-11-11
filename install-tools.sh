#!/bin/bash
set -euo pipefail

on_error() {
  local status=$?
  echo "Install failed at line ${BASH_LINENO[0]}: ${BASH_COMMAND} (exit ${status})" >&2
  exit "$status"
}
trap on_error ERR

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TOOLS_FILE="${SCRIPT_DIR}/tools.txt"

if [[ ! -r /etc/os-release ]]; then
  echo "Cannot detect the operating system." >&2
  exit 1
fi

# shellcheck disable=SC1091
. /etc/os-release

if [[ "${ID:-}" != "debian" && "${ID_LIKE:-}" != *debian* ]]; then
  echo "This installer targets Debian (found ID=${ID:-unknown})." >&2
  exit 1
fi

if [[ ! -f "$TOOLS_FILE" ]]; then
  echo "Package list not found: $TOOLS_FILE" >&2
  exit 1
fi

mapfile -t packages < <(sed -e 's/#.*//' -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//' "$TOOLS_FILE" | grep -v '^$')

if ((${#packages[@]} == 0)); then
  echo "No packages listed in $TOOLS_FILE" >&2
  exit 1
fi

if [[ "$(id -u)" -eq 0 ]]; then
  apt_get=(apt-get)
else
  apt_get=(sudo apt-get)
fi

export DEBIAN_FRONTEND=noninteractive
"${apt_get[@]}" update
"${apt_get[@]}" install -y "${packages[@]}" dirmngr gpg curl gawk

# A tag checkout is a detached HEAD; that notice is not a failure.
# URLs skip the short-name plugin index. Parsing that index is an awk
# call that aborts this script when gawk rejects the invocation.
if [[ ! -f "${HOME}/.asdf/asdf.sh" ]]; then
  git -c advice.detachedHead=false clone --depth 1 --branch v0.13.1 \
    https://github.com/asdf-vm/asdf.git "${HOME}/.asdf"
fi

# shellcheck disable=SC1090
. "${HOME}/.asdf/asdf.sh"

asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin add golang https://github.com/asdf-community/asdf-golang.git

asdf install nodejs latest
asdf install golang latest

asdf plugin add lazydocker https://github.com/comdotlinux/asdf-lazydocker.git

asdf install lazydocker latest
asdf global lazydocker latest

echo "Tools installed successfully."
