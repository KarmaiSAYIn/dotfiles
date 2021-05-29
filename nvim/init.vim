"let mapleader ="," 
if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

if empty(v:servername) && exists('*remote_startserver')
  call remote_startserver('VIM')
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
Plug 'voldikss/vim-floaterm'
Plug 'ptzz/lf.vim'

"Ranger plugins
"Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
"Alternate ranger plugin (The one above doesn't work on Mac)
"Plug 'francoiscabrol/ranger.vim'
"Plug 'rbgrouleff/bclose.vim'

Plug 'tpope/vim-fugitive'
Plug 'junegunn/goyo.vim'
Plug 'jreybert/vimagit'
Plug 'vimwiki/vimwiki'
Plug 'bling/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'ap/vim-css-color'
Plug 'sheerun/vim-polyglot'
Plug 'lervag/vimtex'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'preservim/nerdcommenter'
call plug#end()

source $HOME/.config/nvim/coc.vim

set rtp+=~/.vim/bundle/vim-project/

let g:vimwiki_list = [{'path': '~/.vimwiki'}]

syntax enable
set title
set rnu
set nu
set bg=light
set go=a
set mouse=a
set nohlsearch
set clipboard+=unnamedplus
set noshowmode
set autoindent
set noruler
set laststatus=0
set noshowcmd
set path+=**
set hidden
set encoding=utf-8
set pumheight=10
set fileencoding=utf-8
set cmdheight=2
set iskeyword+=-
set mouse=a
set t_Co=256
set conceallevel=0
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent
set autoindent
set laststatus=0
set showtabline=2
"set noshowmode
"set nobackup
set updatetime=10
set timeoutlen=500
set nowrap

set textwidth=0
set formatoptions-=jcroql
set formatoptions=jtq

source $HOME/.config/nvim/mom.vim
let g:lf_replace_netrw = 1

nmap <leader>r :RnvimrToggle<CR>

hi SpellBad ctermfg=black ctermbg=white
hi DiffChange ctermbg=black
hi DiffAdd ctermbg=darkgrey
hi DiffText ctermbg=5

command Fd filetype detect
command Sck set spell spelllang=en_us
command Maketags !ctags -R .
command Nonu set nonu | set nornu
command Nu set nu | set rnu
command Install write | !sudo make install

nmap <silent> <C-t> :tabnew<ENTER>
nmap <silent> <C-h> :tabprevious<ENTER>
nmap <silent> <C-l> :tabnext<ENTER>
nmap <silent> <Tab>h <C-w>h
nmap <silent> <Tab>j <C-w>j
nmap <silent> <Tab>k <C-w>k
nmap <silent> <Tab>l <C-w>l

nmap L zL
nmap H zH
nmap <silent> gh :CocCommand clangd.switchSourceHeader<ENTER>
nmap <F1> :w !python3 % <ENTER>
nmap <F2> :w <bar> !pdflatex % <ENTER>
nmap <F3> :Cmom <ENTER>
nmap <F4> :w <bar> !bash % <ENTER>
nmap <F5> :w <bar> !gcc % <ENTER>
nmap <F6> :w <bar> !sudo g++ % `wx-config --cxxflags --libs` -o output.o <ENTER> <bar> ./output.o <ENTER>
nmap <F7> :w <bar> !g++ -o a.out % -lX11 -lGL -lpthread -lpng -lstdc++fs -std=c++17 <ENTER>

cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
