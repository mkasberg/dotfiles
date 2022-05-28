# Mike Kasberg's Dotfiles

Managed with [chezmoi](https://www.chezmoi.io) ❤️

## Setup dotfiles on a new machine

  1. (Optional) Install [Bitwarden](https://bitwarden.com/) and login if you plan to install secrets.
     ```
     sudo snap install bw
     bw login
     ```

  2. [Install chezmoi](https://www.chezmoi.io/docs/install/) to `~/bin` and
     install dotfiles to `~/dotfiles`.
     ```
     sh -c "$(curl -fsLS git.io/chezmoi)" -- -b "$HOME/bin" init --apply -S ~/dotfiles mkasberg
     ```

Done! To keep up to date in the future:

    chezmoi update

Want to check the diff before applying changes?

    chezmoi <update|apply> -nv

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

## Start Your Own Dotfiles

Want to use Chezmoi to manage your own dotfiles? The best way to get started is
to follow the [Chezmoi Quick Start
Guide](https://www.chezmoi.io/docs/quick-start/) to start tracking your first
dotfile (`~/.bashrc`, `~/.zshrc`, or `~/.gitconfig` are great files to start
with). Beyond that, I hope you can find some inspiration by looking at my
dotfiles and copying things you like!

## Testing

Want to test a fresh install on a new machine? A dev container in Docker is
great for this because it comes with a non-root user. Use the Docker command
below to get into a fresh, disposable testing environment, then run the
installation steps from above.

    docker run --rm -it --user vscode --workdir /home/vscode mcr.microsoft.com/vscode/devcontainers/base:0-hirsute

## Security

Did you find a vulnerability in my dotfiles? An exposed secret? Some other
security issue? Please report vulnerabilities via email to
[kasberg.mike@gmail.com](mailto:kasberg.mike@gmail.com) or
[mike@mikekasberg.com](mailto:mike@mikekasberg.com).
