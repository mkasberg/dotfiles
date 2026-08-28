# MKPS1 for ZSH
# (Mike Kasberg's PS1)
# (Or, Make PS1)

# Different functions generate different parts (segments) of the PS1 prompt.
# Each function should leave the colors in a clean state (e.g. call reset if they changed any colors).

__mkps1_box_top() {
    echo "%F{4}╭%f"
}

__mkps1_inject_exitcode() {
    local code=$1

    if [ "$code" -ne "0" ]; then
        echo " $code "
    fi
}

__mkps1_exitcode() {
    # We need to run a function at runtime to evaluate the exitcode.
    echo "%K{1}%F{15}\$(__mkps1_inject_exitcode \$?)%f%k"
}

__mkps1_ssh() {
    if [ ! -z "$SSH_TTY" ]; then
        echo "%K{4}%F{240} SSH %f%k"
    fi
}

__mkps1_time() {
    echo "%K{7}%F{0} %* %f%k"
}

__mkps1_username() {
    echo "%F{4} %n %f"
}

__mkps1_arrow() {
    echo "%B%(?:%F{34}➜ :%F{1}➜ )%f%b "
}

__mkps1_workdir() {
    echo "%B%F{4}%~%f%b";
}

__mkps1_git() {
    # Escaping the $ is intentional:
    # This is evaluated when the prompt is generated.
    echo "\$(git_prompt_info)"
}

__mkps1_box_bottom() {
    echo "%F{4}╰%f"
}

__mkps1_user_prompt() {
    echo "%B\$%b ";
}

PROMPT=$'\n'"$(__mkps1_box_top)$(__mkps1_exitcode)$(__mkps1_ssh)$(__mkps1_time)$(__mkps1_username)$(__mkps1_arrow)$(__mkps1_workdir)$(__mkps1_git)"$'\n'"$(__mkps1_box_bottom)$(__mkps1_user_prompt)"

ZSH_THEME_GIT_PROMPT_PREFIX=" %F{25}(%F{5}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
ZSH_THEME_GIT_PROMPT_DIRTY="%F{25}) %F{yellow}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%F{25})"
