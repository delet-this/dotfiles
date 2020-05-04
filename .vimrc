set ruler
set hidden
set mouse=a
set ignorecase
set smartcase
set hlsearch
if has('reltime')
  set incsearch
endif
set autoindent
set confirm
set number
set showcmd
set wildmenu
"set laststatus=2
set notimeout ttimeout ttimeoutlen=200
set clipboard=unnamedplus
set backspace=indent,eol,start
filetype indent plugin on
filetype plugin on
syntax on

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>
