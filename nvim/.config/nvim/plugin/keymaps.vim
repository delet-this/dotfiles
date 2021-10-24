" Insert single character
nnoremap s :exec "normal i".nr2char(getchar())."\e"<CR>
" nnoremap S :<C-U>exec "normal a".RepeatChar(nr2char(getchar()), v:count1)<CR>

" I sometimes mistype :q, should just use ZZ tbh
command! Q :q

" Change windows
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

" Move to start and end of line
noremap H ^
noremap L $

" Create missing path
nnoremap <Leader>m :call mkdir(expand("%:p:h"), "p")<CR>

" Map Ctrl-Backspace to delete the previous word in insert mode.
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

" Jump to overflowed lines
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')

" Center display when searching
nnoremap n   nzz
nnoremap N   Nzz
nnoremap *   *zz
nnoremap #   #zz
nnoremap g*  g*zz
nnoremap g#  g#z

" Unset last search pattern' register with leader space
nnoremap <leader><space> :noh<CR>

" Replace all is aliased to S.
nnoremap S :%s//g<Left><Left>

" Don't cut when using c or C
nnoremap c "_c
nnoremap C "_C

" Make Y behave like D and C
noremap Y y$

" Save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Ctrl H for Hexmode
nnoremap <leader-h> :Hexmode<CR>
vnoremap <leader-h> :<leader-u>Hexmode<CR>

" Keep visual selection after changing indentation
vmap > >gv
vmap < <gv

" Move visual selection with J K 
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Quick record with qq, play with Q
nnoremap Q @q

"FZF
nnoremap <leader>vcc :FZF ~/dotfiles<CR>
