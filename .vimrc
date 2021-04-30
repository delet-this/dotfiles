let mapleader = ","

" Install vim-plug if not found
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(data_dir . '/plugged')
if has('nvim')
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'ThePrimeagen/vim-be-good'
endif
  Plug 'PotatoesMaster/i3-vim-syntax'
  Plug 'tpope/vim-commentary'
  Plug 'vim-airline/vim-airline'
  Plug 'gruvbox-community/gruvbox'
call plug#end()

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

let g:coc_global_extensions = [
\ 'coc-css',
\ 'coc-json',
\ 'coc-sh',
\ 'coc-python',
\ 'coc-clangd',
\ ]

if has('nvim')
  set inccommand=nosplit
endif

set nocompatible
set mouse=a
set clipboard=unnamedplus
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set laststatus=2
set hidden
set confirm
set number relativenumber
set ignorecase
set smartcase
set scrolloff=5
set updatetime=50
set nowrap
filetype plugin on

colorscheme gruvbox

" Map Ctrl-Backspace to delete the previous word in insert mode.
  noremap! <C-BS> <C-w>
  noremap! <C-h> <C-w>

" jump to overflowed lines
  nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
  nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')

" center display after searching
  nnoremap n   nzz
  nnoremap N   Nzz
  nnoremap *   *zz
  nnoremap #   #zz
  nnoremap g*  g*zz
  nnoremap g#  g#z

" This unsets the 'last search pattern' register by hitting return
	nnoremap <CR> :noh<CR><CR>

" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>

" Don't cut when using c or C
  nnoremap c "_c
  nnoremap C "_C

" Save file as sudo on files that require root permission
	cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Automatically deletes all trailing whitespace and newlines at end of file on save.
	autocmd BufWritePre * %s/\s\+$//e
	autocmd BufWritepre * %s/\n\+\%$//e

" Relative numbers in normal mode, absolute numbers in insert mode
	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
	autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber

" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
