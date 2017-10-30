" Vim customization 

set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'jnurmine/Zenburn'
Plugin 'klen/python-mode'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-latex/vim-latex'
Plugin 'panozzaj/vim-autocorrect'
Plugin 'blindFS/vim-taskwarrior'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set splitbelow
set splitright
set textwidth=75 

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Ctrl-j move to the split below
"Ctrl-k move to the split above
"Ctrl-l move to the split to the right
"Ctrl-h move to the split to the left

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable automatic closing of (,{,[,"
:inoremap ( ()<Esc>i
:inoremap [ []<Esc>i
:inoremap { {}<Esc>i
:inoremap " ""<Esc>i
:inoremap ' ''<Esc>i

" Enable folding with the space bar
nnoremap <space> za

let g:SimpylFold_docstring_preview=1

"tab spaces
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=80 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

"Flag Unnecessary White space
au BufRead, BufNewFile *.py, *.pyw, *.c, *.h match BadWhitespace /\s\+$/

"UTF8-Support
set encoding=utf-8

"Limit mutt width to 72 characters
au BufRead /tmp/mutt-* set tw=72

"Python with virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

"Syntax highlighting
let python_highlight_all=1
syntax on

autocmd VimEnter * wincmd p

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
nnoremap <C-e> :NERDTreeToggle<CR>

"Line numbering
set nu

"Clipboard integration
set clipboard=unnamed

"Set your grep program to always generate a file-name.
set grepprg=grep\ -nH\ $*

"The following changes the default file type back to 'tex':
let g:tex_flavor='latex'

au BufNewFile,BufRead *.tex
    \ set breakindent
 
"Compile to PDF as default
let g:Tex_DefaultTargetFormat='pdf'

"Auto spelling
if has("spell")
  set spell
  map <F4> :set spell!<CR><Bar>:echo "Spell Check: " . strpart("OffOn", 3 * &spell, 3)<CR>
  highlight PmenuSel ctermfg=black ctermbg=lightgray
  set sps=best,10                    
endif

"Airline
set laststatus=2
let g:airline_theme='wombat'

"Cursor color for easier identification
if &term =~ "xterm\\|rxvt"
  "use an orange cursor in insert mode
  let &t_SI = "\<Esc>]12;orange\x7"
  "use a yellow cursor otherwise
  let &t_EI = "\<Esc>]12;yellow\x7"
  silent !echo -ne "\033]12;yellow\007"
  "reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
  "use \003]12;gray\007 for gnome-terminal
endif
