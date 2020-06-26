# Remote SSH Commands

![](https://github.com/itk-dev/actions-remote-ssh/workflows/test/badge.svg)

Action to run a command on a remote server using SSH.

## Example

```yml
- name: Run remote command
  uses: itk-dev/actions-remote-ssh@master
  with:
    command: |      
      ls -a /
      whoami
    host: ${{ secrets.HOST }}
    key: ${{ secrets.PRIVATE_KEY}}
```

You should use GitHub secrest to store the host and private ssh key and the key should be without password.

## Options

* command: Command(s) to execute.
* host: FQDN - Server hostname (default: localhost)
* user: Remote SSH username (default: deploy)
* port: Remote port number (default 22)
* key: File Location or string that contains a private key
* args: Extra SSH parameters