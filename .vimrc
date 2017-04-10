
" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

"autocmd BufEnter * lcd %:p:h

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim74/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/powerline'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets'
Plugin 'garbas/vim-snipmate'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'fatih/vim-go'
Plugin 'elixir-lang/vim-elixir'
Plugin 'rust-lang/rust.vim'

call vundle#end()
set omnifunc=syntaxcomplete#Complete

set splitright
set splitbelow
set dir=~/Tmp/Vim

set laststatus=2   " Always show the statusline
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set term=xterm-256color
set termencoding=utf-8
colo desert

python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
set encoding=utf-8

syntax on                         " show syntax highlighting
filetype plugin indent on
filetype plugin on
set autoindent                    " set auto indent
set ts=2                          " set indent to 2 spaces
set shiftwidth=2
set expandtab                     " use spaces, not tab characters
set smarttab
set autoindent
set nocompatible                  " don't need to be compatible with old vim
set relativenumber                " show relative line numbers
set showmatch                     " show bracket matches
set ignorecase                    " ignore case in search
set hlsearch                      " highlight all search matches
set cursorline                    " highlight current line
set smartcase                     " pay attention to case when caps are used
set incsearch                     " show search results as I type
set ruler                         " show row and column in footer
set scrolloff=2                   " minimum lines above/below cursor
set nofoldenable                  " disable code folding
set clipboard=unnamed             " use the system clipboard
set wildmenu                      " enable bash style tab completion
set wildmode=list:longest,full
set noesckeys
set ttimeout
set ttimeoutlen=1

set runtimepath^=~/.vim/bundle/ctrlp.vim
" set leader key to comma
let mapleader = ","
"
" " ctrlp config
let g:ctrlp_map = '<leader>f'
let g:ctrlp_max_height = 30
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 0
"
" " use silver searcher for ctrlp
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" map Silver Searcher
map <leader>a :Ag!<space>
"
" " search for word under cursor with Silver Searcher
map <leader>A :Ag! "<C-r>=expand('<cword>')<CR>"
"
" " clear the command line and search highlighting
noremap <C-l> :nohlsearch<CR>
"
" " toggle spell check with <F5>
map <F5> :setlocal spell! spelllang=en_us<cr>
imap <F5> <ESC>:setlocal spell! spelllang=en_us<cr>

map <F6> <ESC>:!gcc % && ./a.out<cr>

" Use Silver Searcher instead of grep
 set grepprg=ag


set background=dark
highlight ExtraWhitespace ctermbg=1 guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

let g:snipMate = {}
let g:snipMate.scope_aliases = {}
au VimEnter * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'

nmap <leader>n :NERDTreeToggle<CR>

let NERDTreeIgnore = ['\.pyc$', '\.class$']

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l



nnoremap L :tabmove +1<cr>
nnoremap H :tabmove -1<cr>

" View PDF macro; '%:r' is current file's root (base) name.
 nnoremap <leader>v :!mupdf %:r.pdf &<CR><CR>

" LaTeX (rubber) macro for compiling
 nnoremap <leader>p <CR>:!rubber --pdf --warn all %<CR>

let g:tex_flavor='latex'

nnoremap J gT
nnoremap K gt
