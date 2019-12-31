# dotfiles
### セットアップ手順
1. neovimインストール, zshに変更
2. git colne
- git clone --recursive https://github.com/kacky24/.dotfiles.git
3. pyenvをインストール
- https://qiita.com/sigwyg/items/41630f8754c2028a7a9f
- pyenv install 3.7.4 or 2.7.16し、virtualenvでneovim2, neovim3を作成
- neovim2, neovim3でpip install pynvim
- neovim3で、flake8, flake8-import-order, isort, jedi, black
- vim, :CheckHealthで確認
4. nodenvをインストール
- https://yu8mada.com/2018/08/03/how-to-install-neovim-on-macos-using-homebrew-and-set-it-up-to-make-it-able-to-be-used/#content-4-3
- nodenv install 13.2.0
- nodenv global 13.2.0
- npm install --global neovim
- vim, :CheckHealthで確認
6. sh init.sh
7. sh dotfilesLink.sh
8. vim, :CocInstall coc-python coc-json coc-ultisnips

### vimキーバインドまとめ
- ale
  - エラー箇所への移動: \<C-j>, \<C-k>
  - 自動補正: :ALEFix
- nerdtree
  - 開く: \<C-e>
  - 全部更新: \<S-r>(選択ノード更新: r))
- fzf
  - History: \<C-p>
- coc
  - モジュールの定義元ファイルへ移動: gd
  - モジュールのreference一覧: gr
  - 補完候補の選択の際の移動: \<C-j>, \<C-k> or \<Tab>, \<S-Tab>
    - ultisnipsによるsnippetsも同じく
- neoterm
  - terminal開く: \<C-t>
  - terminal起動時のinsert mode終了: \<C-w>
