set number
set relativenumber
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set spellfile=~/.vim/spell/en.utf-8.add
set spelllang=en_us
set nohlsearch
set incsearch
set scrolloff=8
set signcolumn=yes
set isfname+=@-@
set updatetime=300
set colorcolumn=
set termguicolors
set ignorecase
set smartcase
set nocursorline

let mapleader=" "
let maplocalleader=";"
nnoremap j gj
nnoremap k gk
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap J mzJ`z
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap 9 0w
xnoremap <leader>p "_dP
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y "+Y
nnoremap Q <nop>
nnoremap <leader>p <nop>
nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
nnoremap <leader>pv <nop>
nnoremap <leader>tt :tabnew<CR>
nnoremap <leader>tn :tabnext<CR>
nnoremap <leader>tp :tabprevious<CR>
nnoremap <leader>tx :tabclose<CR>
nnoremap <leader>td :tabnew %<CR>
nnoremap <C-h> :TmuxNavigateLeft<CR>
nnoremap <C-j> :TmuxNavigateDown<CR>
nnoremap <C-k> :TmuxNavigateUp<CR>
nnoremap <C-l> :TmuxNavigateRight<CR>

augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! exe "match IncSearch /\\%".line(".")."l/"
    autocmd CursorMoved,InsertEnter * silent! exe "match none"
augroup END

call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive', {'on': 'G'}
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Chiel92/vim-autoformat'
Plug 'christoomey/vim-tmux-navigator'
Plug 'github/copilot.vim'

call plug#end()
colorscheme catppuccin_mocha

let g:airline_theme = 'catppuccin_mocha'
let g:airline_section_c = airline#section#create(['%f'])
let g:airline_section_x = airline#section#create(['%y'])

nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <leader>ff :NERDTreeToggle<CR>
nnoremap <leader>lg :G<CR>
vnoremap <leader>gcc :Commentary<CR>
nnoremap <leader>gcc :Commentary<CR>
nnoremap <leader>f :Autoformat<CR>
