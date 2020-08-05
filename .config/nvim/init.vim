let mapleader =","

if empty(glob('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall --sync
endif

call plug#begin(system('echo -n "~/config/nvim/plugged"'))
Plug 'PotatoesMaster/i3-vim-syntax'
call plug#end()

set mouse=a
set clipboard=unnamedplus

set laststatus=1
set hidden
set confirm
set number
set ignorecase
set smartcase

" This unsets the "last search pattern" register by hitting return
	nnoremap <CR> :noh<CR><CR>

" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>

" Save file as sudo on files that require root permission
	cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Automatically deletes all trailing whitespace and newlines at end of file on save.
	autocmd BufWritePre * %s/\s\+$//e
	autocmd BufWritepre * %s/\n\+\%$//e
