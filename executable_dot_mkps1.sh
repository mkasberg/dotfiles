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

__mkps1_ssh() {
    if [ ! -z "$SSH_TTY" ]; then
        local bg_blue=`tput setab 4`;
        local dark_gray=`tput setaf 240`;
        local reset=`tput sgr0`;

        echo "\[${bg_blue}${dark_gray}\] SSH \[${reset}\]"
    fi
}

__mkps1_time() {
    local bg_white=`tput setab 7`;
    local black=`tput setaf 0`;
    local reset=`tput sgr0`;

    echo "\[${bg_white}${black}\] \t \[${reset}\]"
}

__mkps1_username() {
    local blue=`tput setaf 4`;
    local reset=`tput sgr0`;

    echo "\[${blue}\] \u \[${reset}\]";
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
    local blue=`tput setaf 4`;
    local reset=`tput sgr0`;

    echo "\[${bold}${blue}\]\w\[${reset}\]";
}

__mkps1_git() {
    local blue=`tput setaf 25`;
    local magenta=`tput setaf 5`;
    local reset=`tput sgr0`;

    # Escaping the $ is intentional:
    # This is evaluated when the prompt is generated.
    echo "\$(__git_ps1 ' \[${blue}\](\[${magenta}\]%s\[${blue}\])\[${reset}\]')"
}

__mkps1_box_top() {
    local blue=`tput setaf 4`;
    local reset=`tput sgr0`;
    echo "\[${blue}\]╭\[${reset}\]"
}

__mkps1_box_bottom() {
    local blue=`tput setaf 4`;
    local reset=`tput sgr0`;
    echo "\[${blue}\]╰\[${reset}\]"
}


__mkps1_user_prompt() {
    local bold=`tput bold`;
    local reset=`tput sgr0`;
    
    echo "\[${bold}\]\$\[${reset}\] ";
}

__mkps1() {
    local ps1="\n$(__mkps1_box_top)$(__mkps1_debian_chroot)$(__mkps1_exitcode)$(__mkps1_ssh)$(__mkps1_time)$(__mkps1_username)$(__mkps1_arrows) $(__mkps1_workdir)$(__mkps1_git)\n$(__mkps1_box_bottom)$(__mkps1_user_prompt)";

    echo "$ps1";
}

# To test, for example, print output before changes and after changes
# and see if the diff is correct.
# Uncomment for testing:
#__mkps1;
