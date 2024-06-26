# dotfiles
### セットアップ手順
1. neovimインストール, zshに変更
- nvim install url: https://github.com/neovim/neovim/wiki/Installing-Neovim
2. git colne
- git clone --recursive https://github.com/kacky24/.dotfiles.git
3. asdfをインストール
- https://asdf-vm.com/guide/getting-started.html
- python3.X.Xをインストールし、pip install pynvim flake8 flake8-import-order isort jedi black
- nodeをインストールし、npm install --global neovim
- vim, :CheckHealthで確認
4. sh init.sh
5. sh dotfilesLink.sh
6. vim, :CocInstall coc-python coc-json coc-ultisnips
7. powerline fontsをitermにインストール
- https://github.com/powerline/fonts
- コマンド
  - git clone https://github.com/powerline/fonts.git --depth=1
  - cd fonts
  - ./install.sh
  - cd ..
  - rm -rf fonts
8. poetryをインストール
- pipxをインストール(Macはbrew)
  - https://pipx.pypa.io/stable/installation/
- pipx install poetry
    - https://python-poetry.org/docs/#installing-with-pipx
- 設定
  - poetry config virtualenvs.in-project true

### zshキーバインドまとめ
- fzf
  - ヒストリー検索: \<C-r>

### vimキーバインドまとめ
- general
  - /~とかで検索をかけた後、
    - 次の検索ワードへの移動: n
    - 前の検索ワードへの移動: N
    - ハイライトを消す: :noh
  - 移動周り
    - 参考URL: https://qiita.com/takeharu/items/9d1c3577f8868f7b07b5
    - 文末移動: $
    - 文頭移動: ^
    - 段落ごとに上へ: {
    - 段落ごとに下へ: }
- tab周り
  - 新規タブ作成: tc or :tabnew
  - 右のタブへ移動: tl or :tabnext
  - 左のタブへ移動: th or :tabprevious
  - タブ一覧を表示: tt or :tabs
  - タブを閉じる: tx or :tabclose
  - 参考URL
    - https://qiita.com/wadako111/items/755e753677dd72d8036d
- ale
  - エラー箇所への移動: \<C-j>, \<C-k>
  - 自動補正: :ALEFix
- nerdtree
  - 開く: \<C-e>
  - 全部更新: \<S-r>(選択ノード更新: r))
  - ファイルを新しいタブで開く: t
  - ドットファイル表示: \<S-i>
  - root dirを指定のディレクトリに下げる: \<S-c>
- fzf
  - :Files: ,F
  - :GFiles, git ls-files: ,f
  - :GFiles?, git status: ,g
  - :History: ,h
  - color sheme一覧: ,c
  - :Rg: ,r
- coc
  - モジュールの定義元ファイルへ移動: gd
  - モジュールのreference一覧: gr
  - 補完候補の選択の際の移動: \<C-j>, \<C-k> or \<Tab>, \<S-Tab>
    - ultisnipsによるsnippetsも同じく
  - 補完で使用するpythonの指定
    - :CocCommand python.setInterpreter
    - 今は、pyenv which pythonを走らせて返ってきたpathを使うようにしているが、若干不具合が起こるかもらしい。
- neoterm
  - terminal開く: \<C-t>
  - terminal起動時のinsert mode終了: \<C-w>
- vim-fugitive
  - git status: :Gstatus or :G or \<Space>gs
    - カーソルを合わせて-でgit add, resetができる
    - カーソルを合わせてDで:Gdiffができる
    - Enterでファイル表示
    - ccで:Gcommitできる
    - caで, git commit --amendできる
  - 今開いているソースをgit add: :Gwrite or \<Space>gw
  - 直前のコミットまで戻る(git checkout filename): :Gread or \<Space>gr
  - git blame: :Gblame or \<Space>gb
  - 変更点を表示: :Gdiff or \<Space>gd
    - conflict時にtarget(左)の方を採用: diffget //2 or \<Space>gh
    - conflict時にmerged(右)の方を採用: diffget //3 or \<Space>gl
    - https://medium.com/prodopsio/solving-git-merge-conflicts-with-vim-c8a8617e3633
  - git commit: :Gcommit or \<Space>gc
  - git push: :Gpush or \<Space>gp
  - 基本的には、:Git ~をgit ~の代わりとして色々なgit処理ができる
- winresizer
  - 起動、Resize modeに入る: \<C-s>
  - Resize modeに入る: r
    - h, j, k, lでサイズを変える
  - Focus modeに入る(単純にwindowを移動するmode)): f
    - h, j, k, lで移動
  - Move modeに入る(window自体を移動させるmode): m
    - h, j, k, lで移動
  - 終了
    - 変更を反映して終了: \<Enter>
    - 変更を破棄して終了: q
- previm
  - chromeで起動: \<C-p>
- quickrun
  - 現在のファイル実行: \<Leader>r
- copilot
  - 補完: \<C-j>
  - 次の候補へ: \<C-l>
  - 前の候補へ: \<C-h>
  - 候補の削除: \<C-[>
