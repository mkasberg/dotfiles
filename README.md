# Mike Kasberg's Dotfiles

Managed with [chezmoi](https://www.chezmoi.io) ❤️

## Principles

Inspired by [The Primeagen](https://youtu.be/ZH3iKbEiks0?si=F51e9OU5UyxxtnbL&t=144):

 - Try not to stray from defaults. Hopefully, all the non-defaults in my
   dotfiles have a good reason for being there.
 - Make the experience better. Don't just save a keystroke with an alias where
   [TAB] would suffice. Build real functionality.

I'm still working on "never search with your eyes", but I'm headed that way 😁.

## Setup dotfiles on a new machine

 1. [Install Chezmoi](https://www.chezmoi.io/docs/install/) to `~/bin` and
    install dotfiles to `~/dotfiles`.
    ```
    sh -c "$(curl -fsLS git.io/chezmoi)" -- -b "$HOME/bin" init --apply -S ~/dotfiles mkasberg
    ```

 2. (Optional) Install secrets. (The kasm-secrets script is installed with
    dotfiles.)
    
    ```
    kasm-secrets install
    ```

Done! To keep up to date in the future:

    chezmoi update

Want to check the diff before applying changes?

    chezmoi <update|apply> -nv

## Notable Features

* Cross-platform (macOS & Linux)
* Scripts to install [system](kasm-updater/install_ubuntu_applications.sh)
  and [user](kasm-updater/user_installs.sh) applications and preferences
* Custom [PS1 Bash Prompt](https://github.com/mkasberg/dotfiles/blob/1cf2a9c5787fa326ff2228414117beb479145147/dot_bashrc#L63-L64)
* Custom [Oh My Zsh Theme](dot_zsh_custom/themes/mkasberg.zsh-theme)
* Set the default shell to [zsh](https://github.com/mkasberg/dotfiles/blob/1cf2a9c5787fa326ff2228414117beb479145147/run_once_02-user-installs.sh.tmpl#L8-L13) on Ubuntu
* Per-machine [git email](https://github.com/mkasberg/dotfiles/blob/1cf2a9c5787fa326ff2228414117beb479145147/dot_gitconfig.tmpl#L4), set once during setup
* Optionally (per machine) install [secrets from Bitwarden](bin/executable_kasm-secrets)
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

Want to test a fresh install on a new machine? A Docker container with a
non-root user is great for this. For convenience, `./test.sh` will install
dotfiles from the current working directory and drop you into a prompt in a
clean, disposable Docker environment.

## Security

Did you find a vulnerability in my dotfiles? An exposed secret? Some other
security issue? Please report vulnerabilities via email to
[kasberg.mike@gmail.com](mailto:kasberg.mike@gmail.com) or
[mike@mikekasberg.com](mailto:mike@mikekasberg.com).
