set nocompatible
"""""""""
" Plugins
call plug#begin()
" Tim Pope-fest:
Plug 'tpope/vim-sensible'  " Sensible defaults
Plug 'tpope/vim-fugitive'  " Git awareness
Plug 'tpope/vim-surround'  " Surround text

" Seemless window motion between tmux and vim with C-<hjkl>.
Plug 'christoomey/vim-tmux-navigator'

" Uniform commenting commands in any supported language
Plug 'tomtom/tcomment_vim'

" % matches on tags (HTML, LaTeX, etc.)
Plug 'tmhedberg/matchit'

" Ag (:Ag stuff_to_grep_for)
Plug 'rking/ag.vim'

call plug#end()
""""""""""""""""""
" STANDARD VIM SETTINGS
set expandtab           " The tab key is great.  Tabs suck.
colo elflord            " Seems easiest to read
set gfn=Monospace\ 10   " Seems easiest to read
set number              " Go places with : without being Rainman
set shiftwidth=2        " Google style recommended. I agree.
set softtabstop=2       " Google style recommended. I agree.
set visualbell          " Turn off beeping
set ww=s,<,>,[,]        " Space and arrow keys should ignore end of lines

" Tabs are the enemy and should be see. (They are fixed for Go below).
set tabstop=8

" The default is \. Change this before sourcing packages.
let mapleader = ","

" _ and - are not part of the default
" This way, ctrl+n will complete underscored_phrases-and-stuff
" Also, no colon so that Python syntax highlighting works.
set iskeyword=@,48-57,192-255,_,-

""""""""""""""""""
" PERSONAL REMAPPINGS

" As God intended
imap <C-BS> ^W

" Move through buffers
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>

" Format command
map <leader>f :FormatCode<CR>
map <leader>l :FormatLines<CR>
map <leader>n :NERDTreeToggle<CR>

" Git grep
nmap <leader>g :Ag <C-R><C-W> *<CR>

""""""""""""""""""""""""
" SYNTASTIC
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

""""""""""""""""""
" FILE TYPES
" Vim thinks .md is Modula-2
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Octave: .vim/syntax/octave.vim is from
" http://www.vim.org/scripts/script.php?script_id=3600
autocmd BufReadPost,BufNewFile *.m,*.oct set filetype=octave

" Don't convert tabs to spaces in a tsv
autocmd BufReadPost,BufNewFile *.tsv set noexpandtab
""""""""""""""""""
" PERSONAL HACKS
" Avoid trailing whitespace
function! TrimWhiteSpace()
  %s/\s*$//
  ''
:endfunction
autocmd FileWritePre * :call TrimWhiteSpace()
autocmd FileAppendPre * :call TrimWhiteSpace()
autocmd FilterWritePre * :call TrimWhiteSpace()
autocmd BufWritePre * :call TrimWhiteSpace()

autocmd QuickFixCmdPost *grep* cwindow
""""""""""""""""""
" GO CONFIGURATION
" Clear filetype flags before changing runtimepath to force Vim
" to reload them.
"filetype off
"filetype plugin indent off
"set runtimepath+=$GOROOT/misc/vim
"   formatting
"autocmd FileType go autocmd BufWritePre <buffer> Fmt

" It's a good idea to call this at the end, after everything has loaded.
" Can consider removing indent.
filetype plugin on

" Python
autocmd FileType python setlocal shiftwidth=2 softtabstop=2
