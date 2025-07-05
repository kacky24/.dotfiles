# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## dotfilesについて

このrepositoryは、Neovim、Zsh、Tmuxなどのconfiguration fileを管理するためのdotfilesのcollectionです。

### Core Architecture

- `nvim/`: Neovimの設定。Lua-basedのconfigurationで、Lazy.nvimをplugin managerとして使用
- `.zsh/`: Zshの設定とPreztoのframework
- `.tmux.conf`: Tmuxの設定
- `init.sh`: git submoduleを初期化するscript
- `dotfilesLink.sh`: symbolic linkを作成するscript

### セットアップとdeployment

1. **初期セットアップ**:
   ```bash
   git clone --recursive https://github.com/kacky24/.dotfiles.git
   sh init.sh
   sh dotfilesLink.sh
   ```

2. **dependencies**:
   - asdf: version manager
   - Python環境: `pip install pynvim flake8 flake8-import-order isort jedi black`
   - Node.js環境: `npm install --global neovim`
   - Poetry: Python dependency management
   - Powerline fonts: terminalでの表示用

### Neovim Configuration Structure

- `nvim/init.lua`: entry point
- `nvim/lua/config/`: core configuration (options, keymaps, autocmds)
- `nvim/lua/plugins/`: 各pluginの個別設定
- `nvim/lua/plugin_list.lua`: 使用するplugin listの定義
- `nvim/lua/config/lazy_nvim.lua`: Lazy.nvimの初期化とplugin loading logic

### 主要なkeymap

**Vim/Neovim**:
- Tab操作: `tc` (新規), `tl`/`th` (移動), `tx` (閉じる)
- File explorer: `<C-e>` (NERDTree)
- Terminal: `<C-t>` (Neoterm)
- FZF: `,f` (git files), `,F` (all files), `,r` (Ripgrep)
- Git: `<Space>gs` (status), `<Space>gd` (diff), `<Space>gc` (commit)
- Window resize: `<C-s>` (Winresizer mode)

**Zsh**:
- History search: `<C-r>` (fzf)

### Plugin Management

pluginはLazy.nvimで管理され、`plugin_list.lua`でlist化されています。新しいpluginを追加する場合：
1. `lua/plugin_list.lua`にplugin名を追加
2. `lua/plugins/[plugin名].lua`でconfigurationを作成

### Development Commands

```bash
# Health checkの実行（Neovim内で）
:checkhealth

# Coc extensions install（Neovim内で）
:CocInstall coc-python coc-json coc-ultisnips

# Python interpreter設定（Neovim内で）
:CocCommand python.setInterpreter
```

### Notes

- configurationは主に日本語commentで記述されています
- Python developmentに特化したsetup
- Git workflowはvim-fugitiveで統合
- copilotとcoc.nvimの併用でcode completion