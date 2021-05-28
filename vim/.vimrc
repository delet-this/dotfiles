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
  Plug 'neoclide/jsonc.vim'
  Plug 'PotatoesMaster/i3-vim-syntax'
  Plug 'tpope/vim-commentary'
  Plug 'vim-airline/vim-airline'
  Plug 'gruvbox-community/gruvbox'
  Plug 'joshdick/onedark.vim'
  Plug 'dstein64/vim-startuptime'
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
" Substitution live preview
  set inccommand=nosplit
endif
set path+=**
set wildmenu
set mouse=a
set clipboard=unnamedplus
set nocompatible
" Indent
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
" Syntax
syntax on
filetype plugin on
" Visual
set showtabline=2
set noshowmode
set nowrap
set number relativenumber
set laststatus=2
set background=dark
if has('termguicolors')
  set termguicolors
endif
colorscheme onedark
" Misc
set hidden
set confirm
set scrolloff=5
set updatetime=50

let mapleader = " "

" Create missing path
  nnoremap <Leader>m :call mkdir(expand("%:p:h"), "p")<CR>

" Map Ctrl-Backspace to delete the previous word in insert mode.
  noremap! <C-BS> <C-w>
  noremap! <C-h> <C-w>

" Jump to overflowed lines
  nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
  nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')

" Center display after searching
  nnoremap n   nzz
  nnoremap N   Nzz
  nnoremap *   *zz
  nnoremap #   #zz
  nnoremap g*  g*zz
  nnoremap g#  g#z

" This unsets the 'last search pattern' register by hitting escape
  nnoremap <leader><space> :noh<CR>

" Replace all is aliased to S.
  nnoremap S :%s//g<Left><Left>

" Don't cut when using c or C
  nnoremap c "_c
  nnoremap C "_C

" Save file as sudo on files that require root permission
  cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Ctrl H for Hexmode
  nnoremap <C-H> :Hexmode<CR>
  vnoremap <C-H> :<C-U>Hexmode<CR>

" Avoid duplicate auto commands
augroup asdf
" Clear any existing autcmds from this group
  autocmd!

" Automatically deletes all trailing whitespace and newlines at end of file on save.
  autocmd BufWritePre * %s/\s\+$//e
  autocmd BufWritepre * %s/\n\+\%$//e

" Relative numbers while focused AND not in insert mode,
" absolute numbers while unfocused OR in insert mode
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber

" Disables automatic commenting on newline:
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END

" ex command for toggling hex mode - define mapping if desired
  command -bar Hexmode call ToggleHex()

" helper function to toggle hex mode
function ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    silent :e " this will reload the file without trickeries
              "(DOS line endings will be shown entirely )
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    %!xxd -g 1
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    %!xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction

 " let g:onedark_termcolors=16
