""""""""
" Vundle setup
""""""""
set nocompatible              " be iMproved, required
filetype on                  " required <<========== We can turn it on later

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" <============================================>
" Specify the plugins you want to install here.
" We'll come on that later
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'itchyny/lightline.vim'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-commentary'
" <============================================>
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" Put the rest of your .vimrc file hereset expandtab

set tabstop=2
set shiftwidth=2
set softtabstop=2 " Sets the number of columns for a TAB
set expandtab     " Expand TABs to spaces
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
" set mouse=a
syntax on

" necessary for for plugin vim surround / Workaround in order to prevent to
" detlete char with s
xnoremap s s

" necessary for Plugin lightline
set laststatus=2

autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

" switch between paste and nopaste modes while editing the text! 
set pastetoggle=<F3>

" Edit visual configs...
if &term =~ "xterm\\|rxvt"
  " use an orange cursor in insert mode
  let &t_SI = "\<Esc>]12;orange\x7"
  " use a red cursor otherwise
  let &t_EI = "\<Esc>]12;red\x7"
  silent !echo -ne "\033]12;red\007"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
  " use \003]12;gray\007 for gnome-terminal
endif

autocmd FileType yaml,python setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType python nnoremap <buffer> <F9> :update<bar>!clear;python %<CR>

let g:go_version_warning = 0
set wildmenu
