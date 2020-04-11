# Mike Kasberg's Dotfiles

Managed with [chezmoi](https://www.chezmoi.io).

## Setup dotfiles on a new machine

  1. Install Bitwarden (needed to decrypt secrets) and login.
     ```
     $ sudo snap install bw
     $ bw login
     ```

  2. Install chezmoi to `~/bin`.
     ```
     $ curl -sfL https://git.io/chezmoi | sh
     ```

  3. Initialize chezmoi. Use `https` since we don't have creds yet.
     ```
     $ bin/chezmoi init https://github.com/mkasberg/dotfiles.git
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

