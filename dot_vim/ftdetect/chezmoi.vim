" Dotfiles in the chezmoi source dir have non-standard extensions.
" Setting rules here based on those extensions can make Vim choose the correct file type.
au BufRead,BufNewFile dot_bashrc            set filetype=bash
au BufRead,BufNewFile dot_zshrc             set filetype=zsh
au BufRead,BufNewFile dot_profile           set filetype=sh


au BufRead,BufNewFile dot_vimrc             set filetype=vim
au BufRead,BufNewFile dot_gitconfig.tmpl    set filetype=gitconfig

au BufRead,BufNewFile *.sh.tmpl             set filetype=sh
