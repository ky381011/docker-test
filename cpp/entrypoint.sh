#!/bin/bash
set -e

# copy pub_key
if [ -f /authorized_keys ]; then
  mkdir -p /home/dev/.ssh
  cp /authorized_keys /home/dev/.ssh/authorized_keys
  chown -R dev:dev /home/dev/.ssh
  chmod 700 /home/dev/.ssh
  chmod 600 /home/dev/.ssh/authorized_keys
fi

# start sshd
exec /usr/sbin/sshd -D