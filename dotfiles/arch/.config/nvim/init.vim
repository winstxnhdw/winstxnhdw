set shiftwidth=4
set tabstop=4
set softtabstop=0
set expandtab
set smarttab
set autoindent

set background=dark
set number
set scrolloff=7
set noswapfile
syntax enable
    
" Plugins will be downloaded under the specified directory.
call plug#begin()

" Declare the list of plugins.
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'lambdalisue/suda.vim'
Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'norcalli/nvim-colorizer.lua'
" List ends here. Plugins become visible to Vim after this call.

call plug#end()

let g:gruvbox_contrast_dark='hard'
let g:airline_theme='gruvbox'
colorscheme gruvbox

if (has("termguicolors"))
  set termguicolors
endif

lua require 'colorizer'.setup()

" NERDTree
let NERDTreeQuitOnOpen=1
let g:NERDTreeMinimalUI=1
nmap <F2> :NERDTreeToggle<CR>
