# Dot files

Personal configuration for a Debian machine: the bash profile, Git settings, keyboard layout, and an installer for the day-to-day dev tools.

## Commands

```sh
make install
make apply
make versioning
```

- `make install` installs the apt packages in `tools.txt`, then asdf and the latest Node.js, Go, and lazydocker. It targets Debian and uses `sudo` when it is not already root.
- `make apply` copies `.bash_profile` from this directory into `$HOME`.
- `make versioning` copies `$HOME/.bash_profile` back into this directory so local edits can be committed.

`make` with no target lists these commands.

## Files

- `Makefile` project commands.
- `.bash_profile` sets the prompt (user, host, path, and current Git branch), shell and Docker/Git aliases, and loads asdf.
- `bashapply.sh` copies `.bash_profile` to `$HOME`. `make apply` runs it.
- `versioning.sh` copies `$HOME/.bash_profile` into this directory. `make versioning` runs it.
- `install-tools.sh` is the Debian installer behind `make install`. It reads `tools.txt`, installs those packages plus `dirmngr`, `gpg`, `curl`, and `gawk`, clones asdf v0.13.1 into `~/.asdf` when that checkout is missing, and installs Node.js, Go, and lazydocker.
- `tools.txt` lists apt package names, one per line: `vim`, `git`, `htop`, `silversearcher-ag`, `terminator`, `build-essential`, and the curl, libxml2, and OpenSSL build libraries.
- `test-install-tols.sh` runs `install-tools.sh` inside a disposable Debian 13 container with this directory mounted, so the installer can be tried without changing the host.
- `.gitconfig` sets the Git identity, `main` as the default branch, Vim as the editor, and Chrome as the web browser.
- `keyboard` is the XKB configuration for a Brazilian ABNT2 keyboard, meant for `/etc/default/keyboard`.
- `cheatsheets.md` has short notes
