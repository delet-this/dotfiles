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
  Plug 'williamboman/nvim-lsp-installer'
  " Plug 'creativenull/diagnosticls-configs-nvim'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/nvim-cmp'
  " Plug 'tami5/lspsaga.nvim', { 'commit': 'c884214b57fea2f5f6f04e1245a3e55cc19bbe96'}
  " Plug 'jose-elias-alvarez/null-ls.nvim'
  Plug 'mfussenegger/nvim-lint'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-treesitter/nvim-treesitter-textobjects'
  Plug 'nanotee/sqls.nvim'
  " Add LSP support to existing themes
  Plug 'folke/lsp-colors.nvim'
  " Indentation guides
  Plug 'lukas-reineke/indent-blankline.nvim'
  " Illuminate other uses of variable etc.
  Plug 'rrethy/vim-illuminate'
endif
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
  " Plug 'tpope/vim-commentary'
  Plug 'numToStr/Comment.nvim'
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
  if has('nvim')
    Plug 'gelguy/wilder.nvim', {'do': ':UpdateRemotePlugins'}
  else
    Plug 'gelguy/wilder.nvim'

    " To use Python remote plugin features in Vim, can be skipped
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
  endif
" More text objects/targets
  Plug 'wellle/targets.vim'

" Themes
  " Plug 'itchyny/lightline.vim'
  if !has('nvim')
    Plug 'gruvbox-community/gruvbox'
  endif
  if has('nvim')
    Plug 'ellisonleao/gruvbox.nvim'
    Plug 'nvim-lualine/lualine.nvim'
  endif
  Plug 'sainnhe/sonokai'
  Plug 'joshdick/onedark.vim'
  Plug 'glepnir/dashboard-nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'dstein64/vim-startuptime'
  Plug 'karb94/neoscroll.nvim'
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

set path+=**
set wildmode=longest:full,full
" set completeopt=menu,menuone,noselect
set undofile
set backup
set backupcopy

let g:backupdir=expand(stdpath('data') . '/backup')
if !isdirectory(g:backupdir)
   mkdir(g:backupdir, "p")
endif
let &backupdir=g:backupdir

set mouse=a
" System clipboard
set clipboard=unnamedplus
" Indent
set smartindent
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
if !has('nvim')
  syntax on
  filetype plugin indent on
endif
" Visual
set signcolumn=yes
set showtabline=1
set noshowmode
set nowrap
set number relativenumber
set laststatus=2
set background=light
set colorcolumn=80
" set cursorline
let g:sonokai_style = 'andromeda'
let g:onedark_terminal_italics = 2
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
