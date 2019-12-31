# dotfiles
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
5. sh init.sh
6. sh dotfilesLink.sh
