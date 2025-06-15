#!/bin/bash

# Script executed in container
echo "$PUBLIC_KEY" > /home/dev/.ssh/authorized_keys
chown dev:dev /home/dev/.ssh/authorized_keys
chmod 600 /home/dev/.ssh/authorized_keys