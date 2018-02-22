" .vimrc

" plugin
let s:dein_dir = expand('~/.vim/dein')
" dein.vim
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'
  
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype indent on

" 表示設定
set nu
set ruler
set cursorline
set cursorcolumn
highlight CursorColumn ctermbg=239
highlight CursorColumn ctermfg=255
set scrolloff=4
set sidescrolloff=5
set virtualedit=onemore
set showmatch
set matchtime=1
syntax on
au BufNewFile,BufRead *.md :set filetype=markdown
set nowrap
set laststatus=2
set wildmode=list:longest

set visualbell "ビープ音可視化
set display=lastline "長い行が見切れない

" 検索設定
set ignorecase
set smartcase
set wrapscan
set incsearch
set hlsearch
nnoremap <Esc><Esc> :nohlsearch <CR>

" 入力設定
set expandtab
set tabstop=2
set smartindent

nnoremap t o<Esc>
nnoremap T O<Esc>
" 編集設定
set clipboard+=unnamed
