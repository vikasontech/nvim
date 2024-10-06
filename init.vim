"===============================
" Neovim Configuration
"===============================

" Enable line numbers
set number

" Enable relative line numbers
set relativenumber

" Enable syntax highlighting
syntax on

" Set tabs and spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Enable clipboard to use system clipboard
set clipboard=unnamedplus

" Set mouse support
set mouse=a

" Show matching brackets
set showmatch

" Use 24-bit colors
set termguicolors

" Set completeopt for better completion experience
set completeopt=menuone,noinsert,noselect

"===============================
" Plugin management using vim-plug
"===============================
call plug#begin('~/.local/share/nvim/plugged')

" File explorer (like VSCode explorer)
Plug 'preservim/nerdtree'

" Fuzzy finder (like VSCode command palette)
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'

Plug 'ctrlpvim/ctrlp.vim'

" Autocompletion and LSP support (like VSCode IntelliSense)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Syntax highlighting using TreeSitter
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Airline status bar (for a better UI)
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Git integration (like VSCode Git plugin)
Plug 'tpope/vim-fugitive'

" Displays tags (like classes, functions) in a sidebar for easy navigation.
" Useful for navigating through larger Python codebases.
" required brew install universal-ctags
Plug 'preservim/tagbar'


call plug#end()

"===============================
" LSP Configuration using coc.nvim
"===============================
" Enable coc.nvim for language server support
let g:coc_global_extensions = ['coc-json', 'coc-tsserver', 'coc-python', 'coc-html', 'coc-css', 'coc-clangd']

" Map keys for code navigation and completion
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <Tab> and <S-Tab> to navigate through popup menu in completion
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"===============================
" FZF Configuration
"===============================
" Map leader key for opening files using FZF
let mapleader = " "
"
" nnoremap <silent> <leader>p :Files<CR>

" NERDTree file explorer configuration
nnoremap <leader>n :NERDTreeToggle<CR>

"===============================
" CtrlP Configuration
"===============================
let mapleader = " "

noremap <silent> <leader>p :CtrlP<CR>
" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'

" If a file is already open, open it again in a new pane instead of switching to the existing pane
let g:ctrlp_switch_buffer = 'et'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

" let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|node-modules)$',
  \ 'file': '\v\.(pyc|exe|so|dll|jpg|png|mp4|mp3)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
"===============================
" not working 
"===============================
" This will show only Python files in the current directory and its subdirectories. 
" include multiple file types by specifying multiple patterns:
" Files --glob '*.{java,kt,py,js,html}'
" 
" Files --exclude '*.log'
" 
" Rg --type py
" Rg --type java
" Rg --type kt 
"===============================

"===============================
"===============================
" Treesitter Configuration for syntax highlighting
"===============================
" lua << EOF
" require'nvim-treesitter.configs'.setup {
"   ensure_installed = "maintained",
"   highlight = { enable = true },
" }
" EOF

"===============================
" Airline Status Bar
"===============================
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"===============================
" UI and Visual Settings
"===============================
" Set colorscheme
colorscheme desert
