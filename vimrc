set nocompatible
""""""""""""""""""""""""""""
" Packages managed by Vundle
filetype off                  " required
" To install plugins use
"   :PluginInstall

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Tim Pope's sensible ooptions.
Plugin 'tpope/vim-sensible'

" Seemless window motion between tmux and vim with C-<hjkl>.
Plugin 'christoomey/vim-tmux-navigator'

" Google formatting
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmtlib'
" WARNING: I hacked autoload/codefmt.vim
" to add
"   \ '--indent-size', ''.&sw,
" to the 'let l:cmd = ' lines of the autopep section.
Plugin 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
" If this is commented out, be sure to also comment out the configuration
" below.
Plugin 'google/vim-glaive'

" Properly highlights JSON
"Plugin 'elzr/vim-json'

" Nice file browswer
"Plugin 'scrooloose/nerdtree'

" Manipulate surrounding text with 's'
Plugin 'tpope/vim-surround'

" Uniform commenting commands in any supported language
"Plugin 'tomtom/tcomment_vim'

" % matches on tags (HTML, LaTeX, etc.)
Plugin 'tmhedberg/matchit'

" Better formatting for javascript files
"Plugin 'pangloss/vim-javascript'

" Formatting for React .jsx files
"Plugin 'mxw/vim-jsx'

" Takes time to learn, but invaluable for heavy duty LaTeX.
"Plugin 'git://git.code.sf.net/p/vim-latex/vim-latex'
"
call vundle#end()
" Finish Google Formatting Initialization
call glaive#Install()
" Optional: Enable codefmt's default mappings on the <Leader>= prefix.
Glaive codefmt plugin[mappings]

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

map <leader>f :FormatCode<CR>
map <leader>l :FormatLines<CR>

""""""""""""""""""
" FILE TYPES
" Vim thinks .md is Modula-2
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Octave: .vim/syntax/octave.vim is from
" http://www.vim.org/scripts/script.php?script_id=3600
autocmd BufReadPost,BufNewFile *.m,*.oct set filetype=octave
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
filetype plugin indent on
