# .bash_profile                                          

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
# for PS1 Customize
if [ -f ~/.bash_ps1 ]; then
    . ~/.bash_ps1
fi    

#for bash_completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

if [ -f ~/.local/cdj.sh ]; then
    . ~/.local/cdj.sh
fi

