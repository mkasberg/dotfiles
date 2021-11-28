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

    $ chezmoi update

Want to check the diff before applying changes?

    $ chezmoi <update|apply> -nv

## Notable Features

* Scripts to install [system](run_once_01-install-ubuntu-applications.sh.tmpl)
  and [user](run_once_02-user-installs.sh.tmpl) applications and preferences
* Custom [PS1 Bash Prompt](https://github.com/mkasberg/dotfiles/blob/1cf2a9c5787fa326ff2228414117beb479145147/dot_bashrc#L63-L64)
* Custom [Oh My Zsh Theme](dot_zsh_custom/themes/mkasberg.zsh-theme)
* Set the default shell to [zsh](https://github.com/mkasberg/dotfiles/blob/1cf2a9c5787fa326ff2228414117beb479145147/run_once_02-user-installs.sh.tmpl#L8-L13) on Ubuntu
* Per-machine [git email](https://github.com/mkasberg/dotfiles/blob/1cf2a9c5787fa326ff2228414117beb479145147/dot_gitconfig.tmpl#L4), set once during setup
* Optionally (per machine) install [secrets from Bitwarden](https://github.com/mkasberg/dotfiles/blob/1cf2a9c5787fa326ff2228414117beb479145147/.chezmoi.toml.tmpl#L22-L27)
* [Install script](install.sh) for [VS Code Remote Containers Dotfiles](https://code.visualstudio.com/docs/remote/containers#_personalizing-with-dotfile-repositories)
* [Vim filetypes for chezmoi](dot_vim/ftdetect/chezmoi.vim)

## Testing

Want to test a fresh install on a new machine? A dev container in Docker is
great for this because it comes with a non-root user.

    $ docker run --rm -it --user vscode --workdir /home/vscode mcr.microsoft.com/vscode/devcontainers/base:0-hirsute
