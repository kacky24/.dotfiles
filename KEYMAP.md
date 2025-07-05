# Keymap Summary

## Zsh Keybinds

### fzf
- **History検索**: `<C-r>`

### 補完
- **Menu選択での移動**: `h` `j` `k` `l` (vi-style)

## Vim/Neovim Keybinds

### General
- **検索後の移動**:
  - 次の検索wordへ: `n`
  - 前の検索wordへ: `N`
  - Highlightを消す: `:noh`

### 移動
- **文末移動**: `$`
- **文頭移動**: `^`
- **段落ごとに上へ**: `{`
- **段落ごとに下へ**: `}`

### Tab操作
- **新規tab作成**: `tc` または `:tabnew`
- **右のtabへ移動**: `tl` または `:tabnext`
- **左のtabへ移動**: `th` または `:tabprevious`
- **Tab一覧を表示**: `tt` または `:tabs`
- **Tabを閉じる**: `tx` または `:tabclose`

### ALE
- **Error箇所への移動**: `<C-j>`, `<C-k>`
- **自動補正**: `:ALEFix`

### NERDTree
- **開く**: `<C-e>`
- **全部更新**: `<S-r>` (選択node更新: `r`)
- **Fileを新しいtabで開く**: `t`
- **Dotfile表示**: `<S-i>`
- **Root dirを指定のdirectoryに下げる**: `<S-c>`

### FZF
- **:Files**: `,F`
- **:GFiles (git ls-files)**: `,f`
- **:GFiles? (git status)**: `,g`
- **:History**: `,h`
- **Color scheme一覧**: `,c`
- **:Rg**: `,r`

### CoC
- **Moduleの定義元fileへ移動**: `gd`
- **Moduleのreference一覧**: `gr`
- **補完候補の選択の際の移動**: `<C-j>`, `<C-k>` または `<Tab>`, `<S-Tab>`
- **Python interpreter指定**: `:CocCommand python.setInterpreter`

### Neoterm
- **Terminal開く**: `<C-t>`
- **Terminal起動時のinsert mode終了**: `<C-w>`

### vim-fugitive
- **Git status**: `:Gstatus` または `:G` または `<Space>gs`
  - Cursorを合わせて`-`で`git add`, `reset`
  - Cursorを合わせて`D`で`:Gdiff`
  - `Enter`でfile表示
  - `cc`で`:Gcommit`
  - `ca`で`git commit --amend`
- **今開いているsourceを`git add`**: `:Gwrite` または `<Space>gw`
- **直前のcommitまで戻る**: `:Gread` または `<Space>gr`
- **Git blame**: `:Gblame` または `<Space>gb`
- **変更点を表示**: `:Gdiff` または `<Space>gd`
  - Conflict時にtarget(左)を採用: `diffget //2` または `<Space>gh`
  - Conflict時にmerged(右)を採用: `diffget //3` または `<Space>gl`
- **Git commit**: `:Gcommit` または `<Space>gc`
- **Git push**: `:Gpush` または `<Space>gp`

### Winresizer
- **起動 (Resize modeに入る)**: `<C-s>`
- **Resize mode**: `r`
  - `h` `j` `k` `l`でsizeを変更
- **Focus mode (windowを移動)**: `f`
  - `h` `j` `k` `l`で移動
- **Move mode (window自体を移動)**: `m`
  - `h` `j` `k` `l`で移動
- **終了**:
  - 変更を反映して終了: `<Enter>`
  - 変更を破棄して終了: `q`

### Previm
- **Chromeで起動**: `<C-p>`

### Quickrun
- **現在のfile実行**: `<Leader>r`

### Copilot
- **補完**: `<C-j>`
- **次の候補へ**: `<C-l>`
- **前の候補へ**: `<C-h>`
- **候補の削除**: `<C-[>`

### Bufferline
- **次のbufferへ移動**: `<Tab>`
- **前のbufferへ移動**: `<S-Tab>`
- **現在のbufferを削除**: `<leader>bd`
- **Bufferを選択して削除**: `<leader>bp`
- **他のbufferをすべて削除**: `<leader>bo`