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
set clipboard=unnamed


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
syntax enable
 

set termguicolors
"set t_Co=256
"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
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
"tqbに関する設定
" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor

nnoremap <silent>[Tag]c :tabnew<CR>
nnoremap <silent>[Tag]l :tabnext<CR>
nnoremap <silent>[Tag]h :tabprevious<CR>
nnoremap <silent>[Tag]t :tabs<CR>
nnoremap <silent>[Tag]x :tabclose<CR>

"--------------------------------------------------
" python
"
let g:python_host_prog = expand('~/.pyenv/versions/neovim2/bin/python')
let g:python3_host_prog = expand('~/.pyenv/versions/neovim3/bin/python')
"vim-python/python-syntaxによる設定
"self, clsを色付け
let g:python_highlight_class_vars = 1

"--------------------------------------------------
" node
"
let g:node_host_prog = expand('~/.nodenv/versions/19.2.0/bin/neovim-node-host')

"--------------------------------------------------
"lightline
let g:lightline = {'colorscheme': 'molokai'}
"linterの結果をstatuslineに表示
let g:lightline.component_expand = {
  \   'linter_checking': 'lightline#ale#checking',
  \   'linter_warnings': 'lightline#ale#warnings',
  \   'linter_errors': 'lightline#ale#errors',
  \   'linter_ok': 'lightline#ale#ok',
  \ }
let g:lightline.component_type = {
  \   'linter_checking': 'left',
  \   'linter_warnings': 'warning',
  \   'linter_errors': 'error',
  \   'linter_ok': 'left',
  \ }
let g:lightline.active = {
  \   'left': [
  \     ['mode', 'paste'],
  \     ['gitbranch', 'readonly', 'filename', 'modified'],
  \     ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok'],
  \   ]
  \ }
let g:lightline.component_function = {
  \   'gitbranch': 'MyFugitive'}

"https://qiita.com/yuyuchu3333/items/20a0acfe7e0d0e167ccc
function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      let _ = fugitive#head()
      return strlen(_) ? '⭠ '._ : ''
    endif
  catch
  endtry
  return ''
endfunction

"--------------------------------------------------
"nerdtree, vim-nerdtree-tabs
nnoremap <silent><C-e> :NERDTreeTabsToggle<CR>

"--------------------------------------------------
"fzf
"各コマンドのマッピング
nnoremap <silent> ,f :GFiles<CR>
nnoremap <silent> ,F :Files<CR>
nnoremap <silent> ,g :GFiles?<CR>
nnoremap <silent> ,b :Buffers<CR>
nnoremap <silent> ,l :BLines<CR>
nnoremap <silent> ,h :History<CR>
nnoremap <silent> ,m :Mark<CR>
nnoremap <silent> ,c :Colors<CR>
nnoremap <silent> ,r :Rg<CR>

"--------------------------------------------------
"vim-gitgutter
set updatetime=250
highlight GitGutterAdd    guifg=#00ff00 ctermfg=46
highlight GitGutterChange guifg=#ffff00 ctermfg=11
highlight GitGutterDelete guifg=#ff0000 ctermfg=9
"--------------------------------------------------
"ale
"checkのタイミング
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 1
"color
highlight ALEWarningSign guifg=#ffff00 ctermfg=11
highlight ALEErrorSign guibg=#ff0000 ctermbg=9
"C-k, C-jでエラー箇所へ移動
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
"python
let g:ale_linters = {'python': ['flake8']}
let g:ale_fixers = {'python': ['black', 'isort']}
let g:ale_python_flake8_executable = g:python3_host_prog
let g:ale_python_flake8_options = '-m flake8'
let g:ale_python_autopep8_executable = g:python3_host_prog
let g:ale_python_autopep8_options = '-m autopep8'
let g:ale_python_isort_executable = g:python3_host_prog
let g:ale_python_isort_options = '-m isort'
let g:ale_python_black_executable = g:python3_host_prog
let g:ale_python_black_options = '-m black'

"--------------------------------------------------
"coc.nvim
"
"定義元ジャンプの設定
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"tab, shift+tabで候補を上下
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"enterで補完を確定
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"補完で使用するpythonを自動指定	
"参考: https://github.com/neoclide/coc-python/issues/55	
if isdirectory(expand("./.venv"))
    call coc#config('python', {	
    \    'pythonPath': split(execute('!poetry run which python'), '\n')[-1]	
    \ })
elseif isdirectory(expand("~/.pyenv"))	
    call coc#config('python', {	
    \    'pythonPath': split(execute('!pyenv which python'), '\n')[-1]	
    \ })
endif

"--------------------------------------------------
"ultisnips
"
"tabがトリガーとならないようにとりあえずshit+ctr+tでマッピング
let g:UltiSnipsExpandTrigger='<S-C-t>'
"tab, shift+tabで候補を上下
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

"--------------------------------------------------
"supertab
let g:SuperTabContextDefaultCompletionType = "context"
let g:SuperTabDefaultCompletionType = "<c-n>"

"--------------------------------------------------
"neoterm
"位置とサイズ
let g:neoterm_default_mod='belowright'
let g:neoterm_size=10
"--------------------------------------------------
"画面下部にコマンド実行結果が表示
let g:neoterm_autoscroll=1
"C-wでターミナル内の挿入モードを抜けてウィンドウ移動
tnoremap <silent> <C-w> <C-\><C-n><C-w>
";Tnewのマッピング
nnoremap <silent><C-t> :Tnew<CR>

"--------------------------------------------------
"vim-fugitive
nnoremap <silent> <Space>gb :Gblame<CR>
nnoremap <silent> <Space>gd :Gdiff<CR>
nnoremap <silent> <Space>gs :Gstatus<CR>
nnoremap <silent> <Space>gw :Gwrite<CR>
nnoremap <silent> <Space>gr :Gread<CR>
nnoremap <silent> <Space>gc :Gcommit<CR>
nnoremap <silent> <Space>gp :Gpush<CR>
nnoremap <silent> <Space>gh :diffget //2<CR>
nnoremap <silent> <Space>gl :diffget //3<CR>

"--------------------------------------------------
"winresizer
let g:winresizer_start_key='<C-s>'
let g:winresizer_vert_resize=5

"--------------------------------------------------
"previm
"google chromeで開く
let g:previm_open_cmd = 'open -a Google\ Chrome'
nnoremap <silent> <C-p> :PrevimOpen<CR>

"--------------------------------------------------
"quickrun
let g:quickrun_config = {
\   "_" : {
\       "outputter/buffer/split" : ":botright 10sp",
\       "outputter/buffer/close_on_empty" : 1
\   },
\}

"--------------------------------------------------
"copilot
let g:copilot#enable = 1
let g:copilot#enable_default = 1
imap <silent><script><expr> <C-j> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
imap <silent> <C-l> <Plug>(copilot-next)
imap <silent> <C-h> <Plug>(copilot-previous)
