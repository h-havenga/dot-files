set nocompatible
filetype on 

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here
Plugin 'klen/python-mode'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-latex/vim-latex'
Plugin 'panozzaj/vim-autocorrect'
Plugin 'blindFS/vim-taskwarrior'
Plugin 'jalvesaq/nvim-r'
Plugin 'rhysd/vim-grammarous'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'

" All of your Plugins must be added before the following line
call vundle#end() 

" UTF8-Support
syntax enable
set encoding=utf-8

" Airline
set laststatus=2
let g:airline_theme='wombat'

" Indent
set textwidth=70 
set expandtab
set shiftwidth=4
set tabstop=4
set autoindent
set indentkeys=
set breakindent
set showbreak=\ \
" filetype indent off
" filetype plugin indent on

" Line numbering
set number
set relativenumber

" Clipboard integration
set clipboard=unnamedplus

" Search
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch

" Navigating windows
" Ctrl-j move split below | Ctrl-k move split above
" Ctrl-l move split right | Ctrl-h move split left
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable automatic closing of (,{,[, and the enter i mode again
:inoremap ( ()<Esc>i
:inoremap [ []<Esc>i
:inoremap { {}<Esc>i
:inoremap " ""<Esc>i
:inoremap ' ''<Esc>i

" Enable folding with the space bar
nnoremap <space> za
let g:SimpylFold_docstring_preview=1

" Limit mutt characters 
au BufRead /tmp/mutt-* set tw=70

" Syntax highlighting
let python_highlight_all=1

" The following changes the default file type back to 'tex':
let g:tex_flavor='latex'

" Auto spelling
if has("spell")
  set spell
  map <F4> :set spell!<CR><Bar>:echo "Spell Check: " . strpart("OffOn", 3 * &spell, 3)<CR>
  highlight PmenuSel ctermfg=black ctermbg=lightgray
  set sps=best,10                    
endif

" Send selection to R with space bar
vmap t <Plug>RDSendSelection 
nmap t <Plug>RDSendLine

" Remaps for common command mistakes
command! Q :q
command! Qall :qall
command! QAll :qall
command! W :w
command! Wq :wq
command! WQ :wq
command! Wqall :wqall
command! WQall :wqall
command! WQAll :wqall
