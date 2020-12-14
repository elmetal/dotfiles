alias ls='ls -G'
alias gits='git status'

autoload -U compinit && compinit

zstyle ':completion:*:*:git:*' script /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.zsh

source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh

set_ps1() {
setopt PROMPT_SUBST ; PS1='%F{green}%m%f: %F{cyan}%~%f %F{red}$(__git_ps1 "(%s)")%f
\$ '
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd set_ps1

HISTFILE=~/.zhistory           # 履歴の場所。なければ勝手に作られ chmod 600 されます
SAVEHIST=500                   # ファイルに保存する件数。bashのデフォルトと同じにしてみました
HISTSIZE=$(($SAVEHIST * 2))    # メモリに蓄える件数。ここではzshの文法で「$SAVEHISTの2倍」
setopt HIST_EXPIRE_DUPS_FIRST  # 単に古いコマンドより、重複コマンドの方を優先的に忘れるオプション

