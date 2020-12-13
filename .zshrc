alias ls='ls -G'

autoload -U compinit
compinit

zstyle ':completion:*:*:git:*' script /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.zsh

source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh
precmd() {
    __git_ps1 %m '%# ' ' (%s)'
}

HISTFILE=~/.zhistory           # 履歴の場所。なければ勝手に作られ chmod 600 されます
SAVEHIST=500                   # ファイルに保存する件数。bashのデフォルトと同じにしてみました
HISTSIZE=$(($SAVEHIST * 2))    # メモリに蓄える件数。ここではzshの文法で「$SAVEHISTの2倍」
setopt HIST_EXPIRE_DUPS_FIRST  # 単に古いコマンドより、重複コマンドの方を優先的に忘れるオプション
