#!/usr/bin/env bash

# MKPS1
# (Mike Kasberg PS1)
# (Or, Make PS1)

# Different functions generate different parts (segments) of the PS1 prompt.
# Each function should leave the colors in a clean state (e.g. call reset if they changed any colors).

# For Git PS1
source /usr/lib/git-core/git-sh-prompt;
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM="verbose"

__mkps1_debian_chroot() {
    # This string is intentionally single-quoted:
    # It will be evaluated when $PS1 is evaluated to generate the prompt each time.
    echo '${debian_chroot:+($debian_chroot)}';
}

__mkps1_inject_exitcode() {
    local CODE=$1

    if [ "$CODE" -ne "0" ]; then
        echo " $CODE "
    fi
}

__mkps1_exitcode() {
    local BG_RED=`tput setab 1`;
    local WHITE=`tput setaf 15`;
    local RESET=`tput sgr0`;

    # We need to run a function at runtime to evaluate the exitcode.
    echo "\[${BG_RED}${WHITE}\]\$(__mkps1_inject_exitcode \$?)\[${RESET}\]"
}

__mkps1_time() {
    local BG_GRAY=`tput setab 240`;
    local WHITE=`tput setaf 7`;
    local RESET=`tput sgr0`;

    echo "\[${BG_GRAY}${WHITE}\] \t \[${RESET}\]"
}

__mkps1_username() {
    local CYAN=`tput setaf 45`;
    local RESET=`tput sgr0`;

    echo "\[${CYAN}\] \u \[${RESET}\]";
}

__mkps1_arrows() {
    local BOLD=`tput bold`;
    local RED=`tput setaf 1`;
    local GREEN=`tput setaf 34`;
    local RESET=`tput sgr0`;

    echo "\[${BOLD}${RED}\]🮥🮥\[${GREEN}\]🮥\[${RESET}\]";
}

__mkps1_workdir() {
    local BOLD=`tput bold`;
    local CYAN=`tput setaf 45`;
    local RESET=`tput sgr0`;

    echo "\[${BOLD}${CYAN}\]\w\[${RESET}\]";
}

__mkps1_git() {
    local MAGENTA=`tput setaf 213`;
    local RESET=`tput sgr0`;

    # Escaping the $ is intentional:
    # This is evaluated when the prompt is generated.
    echo "\$(__git_ps1 ' (\[${MAGENTA}\]%s\[${RESET}\])')"
}

__mkps1_box_top() {
    local CYAN=`tput setaf 45`;
    local RESET=`tput sgr0`;
    echo "\[${CYAN}\]╭\[${RESET}\]"
}

__mkps1_box_bottom() {
    local CYAN=`tput setaf 45`;
    local RESET=`tput sgr0`;
    echo "\[${CYAN}\]╰\[${RESET}\]"
}


__mkps1_user_prompt() {
    local BOLD=`tput bold`;
    local RESET=`tput sgr0`;
    
    echo "\[${BOLD}\]\$\[${RESET}\] ";
}

__mkps1() {
    local PS1="\n$(__mkps1_box_top)$(__mkps1_debian_chroot)$(__mkps1_exitcode)$(__mkps1_time)$(__mkps1_username)$(__mkps1_arrows) $(__mkps1_workdir)$(__mkps1_git)\n$(__mkps1_box_bottom)$(__mkps1_user_prompt)";

    echo "$PS1";
}

# To test, for example, print output before changes and after changes
# and see if the diff is correct.
# Uncomment for testing:
#__mkps1;
