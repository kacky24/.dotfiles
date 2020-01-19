# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zsh/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zsh/.zprezto/init.zsh"
fi


###########外部設定ファイルの読み込み##########
# 環境変数
source ~/.zsh/.zsh.environment

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.zsh/.p10k.zsh ]] || source ~/.zsh/.p10k.zsh

##########履歴##########
#
# 履歴保存場所
HISTFILE=$HOME/.zsh_history
# メモリに保存される履歴数
HISTSIZE=10000
# 履歴ファイルに保存される履歴数
SAVEHIST=1000000

# 重複するhistoryを持たない
setopt HIST_IGNORE_ALL_DUPS

# 余分な余白は詰めて記録
setopt hist_reduce_blanks

##########補完##########
#
# 補完候補のメニュー選択で、矢印キーの代わりにhjklで移動出来るようにする
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

##########editor##########
alias vim='nvim'

export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'

##########color##########
# 補完でcolorを使用
if [ "$(uname)" = 'Darwin' ]; then
    export LSCOLORS=gxfxcxdxbxegedabagacad
    zstyle ':completion:*' list-colors ${(s.:.)LSCOLORS}
else
    zstyle ':completion:*' list-colors "${LS_COLORS}"
fi

# lsでcolorを使用
if [ "$(uname)" = 'Darwin' ]; then
    alias ls='ls -G'
else
    alias ls='ls --color=auto'
fi
