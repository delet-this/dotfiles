set nocompatible
let mapleader = " "

" Install vim-plug if not found
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(data_dir . '/plugged')
if has('nvim')
" Telescope and its deps
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
  Plug 'ThePrimeagen/vim-be-good'
  Plug 'windwp/nvim-autopairs'
endif
" Sensible defaults
  Plug 'tpope/vim-sensible'
" Language support
if has('nvim')
  Plug 'neovim/nvim-lspconfig'
  " Plug 'creativenull/diagnosticls-configs-nvim'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/nvim-cmp'
  " Plug 'jose-elias-alvarez/null-ls.nvim'
  Plug 'mfussenegger/nvim-lint'
  Plug 'glepnir/lspsaga.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
endif
  " Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Plug 'neoclide/jsonc.vim'
  " Plug 'dense-analysis/ale'
  Plug 'puremourning/vimspector'
  Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
  Plug 'Vimjas/vim-python-pep8-indent'
  Plug 'Chiel92/vim-autoformat'
  Plug 'PotatoesMaster/i3-vim-syntax'
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'ViliLipo/Vimchant'
  Plug 'tpope/vim-sleuth'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-speeddating'
  Plug 'tpope/vim-eunuch'
  Plug 'glts/vim-magnum'
  Plug 'glts/vim-radical'
  Plug 'adelarsq/vim-matchit'
  Plug 'junegunn/goyo.vim'
  Plug 'jdhao/better-escape.vim'
  Plug 'lambdalisue/suda.vim'
  Plug 'mg979/vim-visual-multi'
" More text objects/targets
  Plug 'wellle/targets.vim'
" Themes
  " Plug 'itchyny/lightline.vim'
  if !has('nvim')
    Plug 'gruvbox-community/gruvbox'
  endif
  if has('nvim')
    Plug 'ellisonleao/gruvbox.nvim'
    Plug 'shadmansaleh/lualine.nvim'
  endif
  Plug 'sainnhe/sonokai'
  Plug 'joshdick/onedark.vim'
  Plug 'glepnir/dashboard-nvim'
  Plug 'ryanoasis/vim-devicons' 
  Plug 'dstein64/vim-startuptime'

call plug#end()

if has('termguicolors')
  set termguicolors
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" nnoremap <C-p> <cmd>lua require("telescope.builtin").find_files{ find_command = { "fd", "--type", "f", "--type", "l", "--hidden"} }<cr>

let g:python3_host_prog="/usr/bin/python3"

let g:coc_global_extensions = [
\ 'coc-css',
\ 'coc-json',
\ 'coc-sh',
\ 'coc-pyright',
\ 'coc-clangd',
\ ]

set path+=**
set wildmode=longest:full,full
set completeopt=menu,menuone,noselect
set mouse=a
" System clipboard
set clipboard=unnamedplus
" Indent
set tabstop=4
set shiftwidth=4
set expandtab
" Searching
if has('nvim')
" Substitution live preview
  set inccommand=nosplit
endif
set hlsearch
set incsearch
set ignorecase
set smartcase
" Syntax
syntax on
filetype plugin indent on
" Visual
set showtabline=1
set noshowmode
set nowrap
set number relativenumber
set laststatus=2
set background=light
set colorcolumn=80
" set cursorline
let g:sonokai_style = 'andromeda'
colorscheme sonokai
if !has('nvim')
  colorscheme gruvbox
endif
" Easier to read search results imo
let bg_color = synIDattr(hlID("Normal"), "bg")
execute printf('highlight Search guibg=%s guifg=yellow gui=underline', bg_color)
execute printf('highlight IncSearch guibg=%s guifg=yellow gui=underline', bg_color)
" Misc
set hidden
set confirm
set scrolloff=5
set updatetime=50

augroup init
  autocmd!
" Automatically deletes all trailing whitespace and newlines at end of file on save.
  " autocmd BufWritePre * %s/\s\+$//e
  " autocmd BufWritepre * %s/\n\+\%$//e

" Relative numbers while focused AND not in insert mode,
" absolute numbers while unfocused OR in insert mode
  " let ftToIgnore = ['dashboard']
  " autocmd BufEnter,FocusGained,InsertLeave *  
  "   \ if index(ftToIgnore, &ft) < 0 | set relativenumber
  " autocmd BufLeave,FocusLost,InsertEnter *  
  "   \ if index(ftToIgnore, &ft) < 0 | set norelativenumber

" Disables automatic commenting on newline:
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Detect syntax highlighting on save
  autocmd BufWritePost * if &syntax == '' | :filetype detect | endif

augroup END
