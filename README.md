# dotfiles-public

## Bootstrap Macbook

Install standard Apps from Homebrew and MacAppStore and define dot files.

## PreReqs

- [ ] setup ssh keys
- [ ] setup gpg keys
- [ ] download this repo to local drive

## Steps:-

- [ ] run `bootstrap.sh` script, this will guide you through the setup

---

# Adding your SSH key to the ssh-agent

Before adding a new SSH key to the `ssh-agent` to manage your keys, you should have checked for existing SSH keys and generated a new SSH key. When adding your SSH key to the agent, use the default macOS `ssh-add` command, and not an application installed by macports, homebrew, or some other external source.

1. Start the ssh-agent in the background.

```sh
$ eval "$(ssh-agent -s)"
```

Depending on your environment, you may need to use a different command. For example, you may need to use root access by running `sudo -s -H` before starting the ssh-agent, or you may need to use `exec ssh-agent bash` or `exec ssh-agent zsh` to run the ssh-agent.

2. if you're using macOS Sierra 10.12.2 or later, you will need to modify your `~/.ssh/config` file to automatically load keys into the ssh-agent and store passphrases in your keychain.

  - First, check to see if your `~/.ssh/config` file exists in the default location.
  ```sh
  $ open ~/.ssh/config
  ```

  - If the file doesn't exist, create the file.
  ```sh
  touch ~/.ssh/config
  ```
  - Open your `~/.ssh/config` file, then modify the file to contain the following lines. If your SSH key file has a different name or path than the example code, modify the filename or path to match your current setup.
  ```sh
  Host github.com
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
  ```
  If you chose not to add a passphrase to your key, you should omit the `UseKeychain` line.

3. Add your SSH private key to the ssh-agent and store your passphrase in the keychain. If you created your key with a different name, or if you are adding an existing key that has a different name, replace id_ed25519 in the command with the name of your private key file.

```sh
ssh-add --apple-use-keychain ~/.ssh/id_ed25519
```

Note: The `--apple-use-keychain` option stores the passphrase in your keychain for you when you add an SSH key to the ssh-agent. If you chose not to add a passphrase to your key, run the command without the `--apple-use-keychain` option.



