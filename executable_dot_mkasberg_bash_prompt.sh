#!/usr/bin/env bash

__mk_generate_ps1() {
    local CYAN=`tput setaf 45`;
    local RED=`tput setaf 1`;
    local YELLOW=`tput setaf 11`;
    local GREEN=`tput setaf 34`;
    local BLUE=`tput setaf 27`;
    local MAGENTA=`tput setaf 213`;
    local WHITE=`tput setaf 7`;
    local RESET=`tput sgr0`;
    local BOLD=`tput bold`;
    local PS1="\n\[${CYAN}\]\${debian_chroot:+(\$debian_chroot)}\u\[${RESET}${BOLD}\] \[${RED}\]>>\[${GREEN}\]> \[${CYAN}\]\w\[${RESET}\]\$(__git_ps1 ' (\[${MAGENTA}\]%s\[${RESET}\])')\n\[${BOLD}\]\$\[${RESET}\] ";

    echo "$PS1";
}

# Uncomment for testing:
#__mk_generate_ps1;
