#!/bin/bash
set -euo pipefail
set -x

GRO=$(git remote get-url origin)
ORG=$(dirname ${GRO} | awk -F':' '{ print $2 }')
REPO=$(basename -s .git ${GRO})
DEPS_IMG="ghcr.io/${ORG}/${REPO,,}-deps:latest"

if [[ ! -d "renv" ]]; then
  echo "No renv directory found, using minimal image..."
  DEPS_IMG="ghcr.io/carpentries/workbench-docker:latest-minimal"
  sed -i "s|^FROM .*|FROM $DEPS_IMG|" .devcontainer/Dockerfile
elif docker pull "$DEPS_IMG"; then
  echo "Using: ${DEPS_IMG}"
  # update the Dockerfile FROM
  sed -i "s|^FROM .*|FROM $DEPS_IMG|" .devcontainer/Dockerfile
fi

devcontainer up
