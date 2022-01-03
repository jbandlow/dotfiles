set nocompatible

" Autodownload plug if not present
if empty(glob('~/.vim/autoload/plug.vim'))
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')

" Tim Pope's sensible options.
Plug 'tpope/vim-sensible'

" Tim Pope's package for making Vim git-aware.
Plug 'tpope/vim-fugitive'

" Manipulate surrounding text with 's'
Plug 'tpope/vim-surround'

" Seamless window motion between tmux and vim with C-<hjkl>.
Plug 'christoomey/vim-tmux-navigator'

" Uniform commenting commands in any supported language
Plug 'tomtom/tcomment_vim'

" Properly highlights JSON
Plug 'elzr/vim-json'

" Nice file browswer
Plug 'scrooloose/nerdtree'

" Ag (:Ag stuff_to_ag_for)
Plug 'mileszs/ack.vim'

Plug 'lepture/vim-jinja'
let g:ackprg = 'ag --vimgrep'
cnoreabbrev Ag Ack!
nnoremap <Leader>a :Ack!<Space>
nmap <leader>g :Ack! <C-R><C-W><CR>

" <F7> to run flake8. Call on save for python files.
Plug 'nvie/vim-flake8'
autocmd BufWritePost *.py call Flake8()

" Autoformat on save.
Plug 'Chiel92/vim-autoformat'
au BufWrite *.py :Autoformat
au BufWrite *.cc :Autoformat
" Prefer yapf for python
let g:formatters_python = ['yapf', 'autopep8']
" disable autoindent for filetypes that have incompetent indent files
autocmd FileType vim,tex let g:autoformat_autoindent=0

" Pep8 line width (79 for code and 72 for comments)
Plug 'jimf/vim-pep8-text-width'

" fzf
" Plug '/usr/local/src/fzf'
source $HOME/.fzf/plugin/fzf.vim
nnoremap <Leader>f :FZF<CR>


call plug#end()
""""""""""""""""""
" STANDARD VIM SETTINGS
let $BASH_ENV = '$HOME/.bash_aliases'
set expandtab           " The tab key is great.  Tabs suck.
colo elflord            " Seems easiest to read
set gfn=Monospace\ 10   " Seems easiest to read
set number              " Go places with : without being Rainman
set visualbell          " Turn off beeping
set ww=s,<,>,[,]        " Space and arrow keys should ignore end of lines

" Tabs are the enemy and should be seen.
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

""""""""""""""""""
" FILE TYPES
" Vim thinks .md is Modula-2
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Octave: .vim/syntax/octave.vim is from
" http://www.vim.org/scripts/script.php?script_id=3600
autocmd BufReadPost,BufNewFile *.m,*.oct set filetype=octave

" Don't convert tabs to spaces in a tsv
autocmd BufReadPost,BufNewFile *.tsv set noexpandtab

" I shouldn't need this, but I guess I do:
autocmd BufReadPost,BufNewFile *.cc set shiftwidth=2

" Sagemath is python
autocmd BufNewFile,BufReadPost *.sage set filetype=python
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

" Compile LaTeX on save
autocmd BufWritePost *.tex !latex --output-format=pdf <afile>
