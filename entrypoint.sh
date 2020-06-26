#!/bin/sh

set -eu

SSHPATH="$HOME/.ssh"

mkdir -p "$SSHPATH"
touch "$SSHPATH/known_hosts"

echo "$INPUT_KEY" > "$SSHPATH/deploy_key"
chmod 700 "$SSHPATH"
chmod 600 "$SSHPATH/known_hosts"
chmod 600 "$SSHPATH/id_rsa"

echo "$INPUT_COMMAND exit" > /sshcmd.sh
cat sshcmd.sh

echo Start Run Command


sh -c "ssh $INPUT_ARGS -o StrictHostKeyChecking=no -p $INPUT_PORT -l ${INPUT_USER} ${INPUT_HOST} < sshcmd.sh"
