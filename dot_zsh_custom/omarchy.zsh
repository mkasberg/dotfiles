# Omarchy's shell setup, for zsh.
#
# Omarchy ships its shell setup for bash only ($OMARCHY_PATH/default/bash).
# Files that are also valid zsh are sourced from there, so Omarchy updates
# apply. The bash-specific parts are ported below. Oh My Zsh loads
# $ZSH_CUSTOM/*.zsh after its plugins, so Omarchy's aliases override plugin
# aliases of the same name.
#
# Skipped on purpose:
#   init         starship (the mkasberg theme is the prompt), and mise (the
#                Oh My Zsh mise plugin activates it). zoxide, try, and fzf are
#                ported below.
#   shell        History and completion setup. Oh My Zsh and ~/.zshrc do this.
#   inputrc      Readline only. Oh My Zsh already gives prefix history search on
#                the arrow keys, case-insensitive completion, and menu select.
#   fns/drives, fns/herdr, fns/tmux, fns/ssh-reconnect
#                Use bash-only syntax (read -p, printf -v, zero-based arrays,
#                local argv) that breaks or misbehaves in zsh.
#   fns/worktrees
#                Defines ga and gd functions, which clash with the Oh My Zsh git
#                plugin's ga (git add) and gd (git diff) aliases. zsh expands
#                aliases in function definitions, so sourcing it would define
#                functions named git, add, and diff.
#
# Note that Omarchy's aliases replace the Oh My Zsh git plugin's gcm (git
# checkout main) with git commit -m.

# Not an Omarchy machine (Ubuntu, macOS): do nothing.
command -v omarchy &> /dev/null || return 0

() {
  local dir="${OMARCHY_PATH:-/usr/share/omarchy}/default/bash"
  local fn

  # EDITOR, BROWSER, MANPAGER, locale, PATH. ~/.zshrc sets EDITOR after this.
  source "$dir/envs"
  source "$dir/aliases"
  for fn in compression rsyncing ssh-port-forwarding; do
    [[ -r "$dir/fns/$fn" ]] && source "$dir/fns/$fn"
  done
}

# Ported from $OMARCHY_PATH/default/bash/init
if command -v zoxide &> /dev/null; then
  eval "$(zoxide init zsh)"
fi

if command -v try &> /dev/null; then
  try() {
    unfunction try
    eval "$(SHELL=${commands[zsh]} command try init ~/Work/tries)"
    try "$@"
  }
fi

if [[ -f /usr/share/fzf/key-bindings.zsh ]]; then
  source /usr/share/fzf/key-bindings.zsh
fi

# Completion for the omarchy command. zsh's bashcompinit can't run Omarchy's
# bash completion function (it uses shopt and read -a), so this runs that
# function in bash and hands its results to zsh. Omarchy's completion logic,
# including argument completion, stays Omarchy's own.
_omarchy() {
  local -a candidates
  candidates=(${(f)"$(bash -c '
    source "$1" 2> /dev/null
    shift
    COMP_WORDS=("$@")
    COMP_CWORD=$(($# - 1))
    _omarchy_complete
    printf "%s\n" "${COMPREPLY[@]}"
  ' _omarchy "${OMARCHY_PATH:-/usr/share/omarchy}/default/bash/completions" "${(@)words[1,CURRENT]}")"})

  if (( ${#candidates} )); then
    compadd -a candidates
  else
    _files
  fi
}

if (( ${+functions[compdef]} )); then
  compdef _omarchy omarchy
fi
