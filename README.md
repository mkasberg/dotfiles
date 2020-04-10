# Mike Kasberg's Dotfiles

Managed with [chezmoi](https://www.chezmoi.io).

## Setup dotfiles on a new machine

  1. Install chezmoi to `~/bin`.
     ```
     $ curl -sfL https://git.io/chezmoi | sh
     ```

  2. Check what will happen.
     ```
     $ chezmoi diff
     $ chezmoi -nv apply
     ``` 

  3. Install the dotfiles.
     ```
     $ chezmoi apply
     ```

Done! To keep up to date in the future:

```
$ chezmoi update
```

