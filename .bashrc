# .bashrc                                                                    
    
# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi
    
# User specific aliases and functions

# pu
# enhanced pushd 
function pu {
    if [ -z "$1" ] ; then
    # dont add $DIRSTACK when pu repeated
        test "$PWD" != "$HOME" && pushd $HOME > /dev/null
    else
        pushed "$1" > /dev/null
    fi
}

case "${OSTYPE}" in
darwin*)
    #export LSCOLORS=Ehfxcxdxbxegedabagacad
    alias ls="ls -G"
    ;;
linux*)
    alias ls='ls --color'
    ;;
esac

# for vim
alias vim='/usr/local/Cellar/vim/8.0.1200/bin/vim'
alias vi='vim'
# for Git
alias gs='git status'
alias gd='git diff'
alias gitdiff='git diff'
