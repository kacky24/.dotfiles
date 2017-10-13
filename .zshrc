###########外部設定ファイルの読み込み##########
# 環境変数
source ~/.zsh/.zsh.environment

##########基本設定##########
#
# vi like
bindkey -v

# use color
autoload -U colors

# BEEPを鳴らさない
setopt NO_BEEP

# 日本語ファイル名を表示可能に
setopt print_eight_bit

# prompt
# PROMPT='%m:%c %n$ '
PROMPT="[%n@%m %~]%(!.#.$) "

##########補完##########
#
# 補完機能有効
autoload -U compinit; compinit
zstyle ':completion::complete:*' use-cache true
zstyle ':completion:*:default' menu select=1

# 大文字，小文字区別せず補完
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 補完でcolorを使用
zstyle ':completion:*' list-colors "${LS_COLORS}"

# ディレクトリ名を補完すると，末尾がスラッシュ
setopt AUTO_PARAM_SLASH

# 補完候補のメニュー選択で、矢印キーの代わりにhjklで移動出来るようにする
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

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
