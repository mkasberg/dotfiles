# Mike Kasberg's Dotfiles

Managed with [chezmoi](https://www.chezmoi.io) ❤️

## Setup dotfiles on a new machine

  1. (Optional) Install Bitwarden and login if you plan to install secrets.
     ```
     $ sudo snap install bw
     $ bw login
     ```

  2. [Install chezmoi](https://www.chezmoi.io/docs/install/) to `~/bin`.
     ```
     $ sh -c "$(curl -fsLS git.io/chezmoi)"
     ```

  3. Initialize chezmoi. Use `https` since we don't have creds yet.
     ```
     $ bin/chezmoi init mkasberg
     ```

  4. (Optional) Check the diff.
     ```
     $ chezmoi apply -nv
     ```

  5. Install the dotfiles.
     ```
     $ chezmoi apply
     ```

Done! To keep up to date in the future:

```
$ chezmoi update
```

