#!/usr/bin/env bash

# MKPS1
# (Mike Kasberg PS1)
# (Or, Make PS1)

# Different functions generate different parts (segments) of the PS1 prompt.
# Each function should leave the colors in a clean state (e.g. call reset if they changed any colors).

# For Git PS1
if [ -f /usr/lib/git-core/git-sh-prompt ]; then
    source /usr/lib/git-core/git-sh-prompt
elif [ -f /usr/share/git/completion/git-prompt.sh ]; then
    source /usr/share/git/completion/git-prompt.sh
fi
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM="verbose"

__mkps1_debian_chroot() {
    # This string is intentionally single-quoted:
    # It will be evaluated when $PS1 is evaluated to generate the prompt each time.
    echo '${debian_chroot:+($debian_chroot)}';
}

__mkps1_inject_exitcode() {
    local code=$1

    if [ "$code" -ne "0" ]; then
        echo " $code "
    fi
}

__mkps1_exitcode() {
    local bg_red=`tput setab 1`;
    local white=`tput setaf 15`;
    local reset=`tput sgr0`;

    # We need to run a function at runtime to evaluate the exitcode.
    echo "\[${bg_red}${white}\]\$(__mkps1_inject_exitcode \$?)\[${reset}\]"
}

__mkps1_time() {
    local BG_GRAY=`tput setab 240`;
    local white=`tput setaf 7`;
    local reset=`tput sgr0`;

    echo "\[${BG_GRAY}${white}\] \t \[${reset}\]"
}

__mkps1_username() {
    local cyan=`tput setaf 45`;
    local reset=`tput sgr0`;

    echo "\[${cyan}\] \u \[${reset}\]";
}

__mkps1_arrows() {
    local bold=`tput bold`;
    local red=`tput setaf 1`;
    local green=`tput setaf 34`;
    local reset=`tput sgr0`;

    echo "\[${bold}${red}\]🮥🮥\[${green}\]🮥\[${reset}\]";
}

__mkps1_workdir() {
    local bold=`tput bold`;
    local cyan=`tput setaf 45`;
    local reset=`tput sgr0`;

    echo "\[${bold}${cyan}\]\w\[${reset}\]";
}

__mkps1_git() {
    local magenta=`tput setaf 213`;
    local reset=`tput sgr0`;

    # Escaping the $ is intentional:
    # This is evaluated when the prompt is generated.
    echo "\$(__git_ps1 ' (\[${magenta}\]%s\[${reset}\])')"
}

__mkps1_box_top() {
    local cyan=`tput setaf 45`;
    local reset=`tput sgr0`;
    echo "\[${cyan}\]╭\[${reset}\]"
}

__mkps1_box_bottom() {
    local cyan=`tput setaf 45`;
    local reset=`tput sgr0`;
    echo "\[${cyan}\]╰\[${reset}\]"
}


__mkps1_user_prompt() {
    local bold=`tput bold`;
    local reset=`tput sgr0`;
    
    echo "\[${bold}\]\$\[${reset}\] ";
}

__mkps1() {
    local ps1="\n$(__mkps1_box_top)$(__mkps1_debian_chroot)$(__mkps1_exitcode)$(__mkps1_time)$(__mkps1_username)$(__mkps1_arrows) $(__mkps1_workdir)$(__mkps1_git)\n$(__mkps1_box_bottom)$(__mkps1_user_prompt)";

    echo "$ps1";
}

# To test, for example, print output before changes and after changes
# and see if the diff is correct.
# Uncomment for testing:
#__mkps1;
