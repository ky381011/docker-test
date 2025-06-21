#!/bin/bash
set -e

source gitconfig.env

# Copying ssh pub key from host to container
docker compose exec cpp-ssh bash -c "
  chown -R dev:dev /home/dev/.ssh && \
  chmod 700 /home/dev/.ssh && \
  chmod 600 /home/dev/.ssh/authorized_keys
"

# Setting git config to use github etc.
docker compose exec -u dev cpp-ssh git config --global user.name "$GIT_USER_NAME"
docker compose exec -u dev cpp-ssh git config --global user.email "$GIT_USER_EMAIL"

echo "== All settings applied! =="