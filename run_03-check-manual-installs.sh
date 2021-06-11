#!/usr/bin/env bash

# Google Chrome - manual download once
if [ ! -e /usr/bin/google-chrome ]; then
    echo ""
    echo "Google Chrome Not Found!"
    echo "You should manually install Google Chrome:"
    echo "https://www.google.com/chrome/"
    echo ""
fi

# VS Code
if [ ! -e /usr/bin/code ]; then
    echo ""
    echo "VS Code Not Found!"
    echo "You should manually install VS Code:"
    echo "https://code.visualstudio.com/Download"
    echo ""
fi

#RBEnv
if [ ! -d ~/.rbenv ]; then
    echo ""
    echo "RBEnv Not Found!"
    echo "You should manually install RBEnv:"
    echo "https://github.com/rbenv/rbenv#basic-github-checkout"
    echo ""
else
    echo ""
    curl -fsSL https://github.com/rbenv/rbenv-installer/raw/main/bin/rbenv-doctor | bash
    echo ""
fi

#NVM
if [ ! -d ~/.nvm ]; then
    echo ""
    echo "NVM Not Found!"
    echo "You should manually install NVM:"
    echo "https://github.com/nvm-sh/nvm#installing-and-updating"
    echo ""
fi
