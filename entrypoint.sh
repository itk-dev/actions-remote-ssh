#!/bin/sh

set -eu

# Lock down action to only these branchs to prevent mis-ussaged.
PAT='^refs/tags/.+'
if [ "$GITHUB_REF" == "refs/heads/master" ] || 
   [ "$GITHUB_REF" == "refs/heads/develop" ] || 
   [ "$GITHUB_REF" == "refs/heads/release" ] || 
   [[ $GITHUB_REF =~ $PAT ]]; then
  SSHPATH="/root/.ssh"
  mkdir -p "$SSHPATH"

  # Setup ssh keys.
  echo "$INPUT_KEY" > "$SSHPATH/id_rsa"
  echo "$INPUT_CERT" > "$SSHPATH/id_rsa-cert.pub"
  chmod 700 "$SSHPATH"
  chmod 600 "$SSHPATH/id_rsa"
  chmod 600 "$SSHPATH/id_rsa-cert.pub"

  # Create known hosts.
  touch "$SSHPATH/known_hosts"
  chmod 600 "$SSHPATH/known_hosts"

  # Start agent and add cert
  eval `ssh-agent -s`
  ssh-add

  # Build remote command.
  echo "$INPUT_COMMAND exit" > /sshcmd.sh
  cat /sshcmd.sh

  # Run the command remote
  sh -c "ssh $INPUT_ARGS -i $SSHPATH/id_rsa -o StrictHostKeyChecking=no -p $INPUT_PORT -l ${INPUT_USER} ${INPUT_HOST} < /sshcmd.sh"
else
  echo "Deployment not allowed on this branch ($GITHUB_REF)"
  exit 1;
fi
