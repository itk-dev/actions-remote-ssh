# Remote SSH Commands

![](https://github.com/itk-dev/actions-remote-ssh/workflows/Test%20SSH%20action/badge.svg)

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
    key: ${{ secrets.PRIVATE_KEY }}
    cert: ${{ secrets.PUBLIC_KEY_CERT }}
```

You should use GitHub secrest to store the host and private ssh key and the key should be without password.

## Secrets

These options should be create using secrets.

* HOST
* PRIVATE_KEY
* PUBLIC_KEY_CERT

## Options

* command: Command(s) to execute.
* host: FQDN - Server hostname (default: localhost)
* user: Remote SSH username (default: deploy)
* port: Remote port number (default 22)
* key: File Location or string that contains a private key
* cert: Public signed certificate
* args: Extra SSH parameters