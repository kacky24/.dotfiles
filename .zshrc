# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi


###########外部設定ファイルの読み込み##########
# 環境変数
source ~/.zsh/.zsh.environment
