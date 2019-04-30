# .bashrc                                                                    
    
# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

if [ -f ~/.bash_alias ]; then
    . ~/.bash_alias
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

