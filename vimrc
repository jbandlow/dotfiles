""""""""""""""""""""""""""""
" Packages managed by Vundle
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Properly highlights JSON
Plugin 'elzr/vim-json'

" Nice file browswer
Plugin 'scrooloose/nerdtree'

" Manipulate surrounding text with 's'
Plugin 'tpope/vim-surround'

" Uniform commenting commands in any supported language
Plugin 'tomtom/tcomment_vim'

" % matches on tags (HTML, LaTeX, etc.)
Plugin 'tmhedberg/matchit'

" Better formatting for javascript files
Plugin 'pangloss/vim-javascript'

" Formatting for React .jsx files
Plugin 'mxw/vim-jsx'

" Takes time to learn, but invaluable for heavy duty LaTeX.
"Plugin 'git://git.code.sf.net/p/vim-latex/vim-latex'
"
call vundle#end()

""""""""""""""""""
" STANDARD VIM SETTINGS
set nocompatible        " Otherwise, why have VIM?
syntax on               " Necessary
set incsearch           " Search while typing
set expandtab           " The tab key is great.  Tabs suck.
colo elflord            " Seems easiest to read
set gfn=Monospace\ 10   " Seems easiest to read
set number              " Go places with : without being Rainman
set softtabstop=2       " Easy to read.
set shiftwidth=2        " Should match softtabstop.
set visualbell          " Turn off beeping
set bs=indent,eol,start " Backspace should always work
set ww=s,<,>,[,]        " Space and arrow keys should ignore end of lines

" Tabs are the enemy and should be seen. (They are fixed for Go below).
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
map! <S-Tab> <Left><Left>

" As God intended
imap <C-BS> ^W

" Move through buffers
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>

" Move through windows
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

" NERDTree
map <leader>n :NERDTreeToggle<CR>

""""""""""""""""""
" FILE TYPES
" Vim thinks .md is Modula-2
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

""""""""""""""""""
" HACKS
" Avoid trailing whitespace.
function TrimWhiteSpace()
  %s/\s*$//
  ''
:endfunction
autocmd FileWritePre * :call TrimWhiteSpace()
autocmd FileAppendPre * :call TrimWhiteSpace()
autocmd FilterWritePre * :call TrimWhiteSpace()
autocmd BufWritePre * :call TrimWhiteSpace()

""""""""""""""""""
" GO CONFIGURATION
" Clear filetype flags before changing runtimepath to force Vim
" to reload them.
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
"   formatting
autocmd FileType go autocmd BufWritePre <buffer> Fmt

" It's a good idea to call this at the end, after everything has loaded.
filetype plugin indent on
