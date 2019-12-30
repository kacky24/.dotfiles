"--------------------------------------------------
" deinに関する設定
"
" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,{'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif


"--------------------------------------------------
" 編集に関する設定
"
set nocompatible
set number
set tabstop=4
set shiftwidth=4
set encoding=utf-8
set expandtab
set autoindent
set wildmenu
set backspace=indent,eol,start


"--------------------------------------------------
"キーに関する設定
"
inoremap jj <ESC>
inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<ESC>i
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap [ []<Left>
noremap ; :
noremap : ;
inoremap ; :
inoremap : ;
" j, k による移動を折り返されたテキストでも自然に振る舞うように変更
nnoremap j gj
nnoremap k gk
nnoremap Y y$
" ビープ音を消す
set vb t_vb=
set noerrorbells

filetype off

filetype plugin indent on     " required!
filetype indent on
syntax enable
 

set termguicolors
set t_Co=256
colorscheme molokai

"copy & pasteに関する設定
let OSTYPE = system('uname')
if OSTYPE == "Linux\n"
    noremap yy yy:wv<CR>
    noremap y y:wv<CR>
    noremap p :rv!<CR>p
endif

set viminfo='50,\"3000,:0,n~/.viminfo


"--------------------------------------------------
" python
"
let g:python_host_prog = $HOME . '/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = $HOME . '/.pyenv/versions/neovim3/bin/python'

"--------------------------------------------------
"lightline
let g:lightline = {'colorscheme': 'molokai'}
"--------------------------------------------------
"nerdtree
nnoremap <silent><C-e> :NERDTreeToggle<CR>

"--------------------------------------------------
"jedi-vim
"docstring表示しない
autocmd FileType python setlocal completeopt-=preview

"--------------------------------------------------
"syntax check
let g:syntastic_python_checkers = ['flake8']

"--------------------------------------------------
"supertab
let g:SuperTabContextDefaultCompletionType = "context"
let g:SuperTabDefaultCompletionType = "<c-n>"
