# Mike Kasberg's Dotfiles

Managed with [chezmoi](https://www.chezmoi.io) ❤️

## Setup dotfiles on a new machine

  1. (Optional) Install Bitwarden and login if you plan to install secrets.
     ```
     $ sudo snap install bw
     $ bw login
     ```

  2. [Install chezmoi](https://www.chezmoi.io/docs/install/) to `~/bin` and
     install dotfiles to `~/dotfiles`.
     ```
     $ sh -c "$(curl -fsLS git.io/chezmoi)" -- -b "$HOME/bin" init --apply -S ~/dotfiles mkasberg
     ```

Done! To keep up to date in the future:

```
$ chezmoi update
```

Want to check the diff before applying changes?

```
$ chezmoi <update|apply> -nv
```

## Testing

Want to test a fresh install on a new machine? A dev container in Docker is
great for this because it comes with a non-root user.

```
$ docker run --rm -it --user vscode --workdir /home/vscode mcr.microsoft.com/vscode/devcontainers/base:0-hirsute
```
