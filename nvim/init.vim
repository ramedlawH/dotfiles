set nocompatible
filetype off
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"Install plugins with plug
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')

"Neovim LSP Config
Plug 'neovim/nvim-lspconfig'

"Neovim Autocompletion"
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
"Snippet Engine
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

"Treesitter for code highlighting
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

"Vim airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Vim fugitive for git features inside vim
Plug 'tpope/vim-fugitive'
" Change or remove surrounds
Plug 'tpope/vim-surround'
"a tagbar INFO: need install ctags
Plug 'preservim/tagbar'
"Fuzzy filesearch
Plug 'ctrlpvim/ctrlp.vim'
"show git-diff in the sign column
Plug 'airblade/vim-gitgutter'
" cool commenting features
Plug 'preservim/nerdcommenter'
" Filetree inside vim
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
" Go Support
Plug 'fatih/vim-go', { 'for': 'go' }
" Vim easy-motion
Plug 'easymotion/vim-easymotion'
"Colorscheme
Plug 'folke/tokyonight.nvim', { 'branch': 'main'}

call plug#end()


" require lua plugin configurations
lua require('ramedlawH')

"enable popup menu
set completeopt=menu,menuone,noselect

syntax enable
set encoding=utf8
set number
"Set relative number 
"autocmd InsertEnter * :set norelativenumber
"autocmd InsertLeave * :set relativenumber
"set relativenumber

set laststatus=2
set tabstop=2
set expandtab
set smarttab
set softtabstop=2
set shiftwidth=2
set autoindent
set hlsearch
set showtabline=1
set showcmd
set ruler
set confirm
set nowrap
set nomodeline

"Dark blue line at the right site
set colorcolumn=81
"highlight ColorColumn ctermbg=darkblue

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Spell Checking
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"autocmd FileType markdown setlocal spell

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""Key Bindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {cmd} {attr} {lhs} {rhs}
"
" {cmd} : of the form <?>map, <?>noremap or <?>unmap,
"         where  <?>  can be one of the following:
"
"       :   -   normal, visual, select and operator pending mode
"       :!  -   insert and command-line mode
"       :n  -   normal mode
"       :i  -   insert mode
"       :v  -   visual and select mode
"       :s  -   select mode
"       :x  -   visual mode
"       :c  -   command-line mode
"       :o  -   operator pending mode
"
" {attr} :  optional, one or more of the following
"
"       <buffer>    -   the mapping will by effective in the
"                       current buffer only
"       <silent>    -   the mapping will not be echoed in
"                       the command line
"       <expr>
"       <script>    -   the mapping will only remap charachters
"                       using mappings that were defined local
"       <unique>    -   lets the command fail if the mapping or
"                       abbreviation already exists
"       <special>   -   useful to suppress side effect when
"                       mapping with <> notation for special
"                       characters
"
" Key modifiers:
"   Control     -   <C-key>
"   Shift       -   <S-key>
"   Alt         -   <A-key> or <M-key>
"   Super       -   <T-key>
"
" Special keys:
"   <BS>           Backspace
"   <Tab>          Tab
"   <CR>           Enter
"   <Enter>        Enter
"   <Return>       Enter
"   <Esc>          Escape
"   <Space>        Space
"   <Up>           Up arrow
"   <Down>         Down arrow
"   <Left>         Left arrow
"   <Right>        Right arrow
"   <F1> - <F12>   Function keys F1 to F12
"   <Insert>       Insert
"   <Del>          Delete
"   <Home>         Home
"   <End>          End
"   <PageUp>       page-up
"   <PageDown>     page-down
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Use 'Space' as <leader>
let mapleader ="\<Space>"

"remove trailing whitespaces
:nnoremap <silent><F4> :%s/\s\+$//e<CR>


" show/hide filetree with <F6>
nnoremap <special> <F6> :NERDTreeToggle<CR>
" show/hide tagbar with <F8>
nnoremap <special> <F8> :TagbarToggle<CR>

" comment/uncomment with <C-c> in normal and visual mode
nmap <silent> <C-c> :call nerdcommenter#Comment(0, "toggle")<CR>
vmap <silent> <C-c> :call nerdcommenter#Comment(1, "toggle")<CR>

"buffer switching"
nnoremap <silent><special> <leader>e :bnext<CR>
nnoremap <silent><special> <leader>q :bprevious<CR>
"nnoremap <silent><special> <leader>w :buffers<CR>
nnoremap <silent><special> <leader>1 :1b<CR>
nnoremap <silent><special> <leader>2 :2b<CR>
nnoremap <silent><special> <leader>3 :3b<CR>
nnoremap <silent><special> <leader>4 :4b<CR>
nnoremap <silent><special> <leader>5 :5b<CR>
nnoremap <silent><special> <leader>6 :6b<CR>
nnoremap <silent><special> <leader>7 :7b<CR>
nnoremap <silent><special> <leader>8 :8b<CR>
nnoremap <silent><special> <leader>9 :9b<CR>


"CtrlP
""""""
"Open Buffer
nnoremap <special> <leader>w :CtrlPBuffer<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" color scheme
" 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme tokyonight

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Set CursorLine
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set cursorline
"highlight CursorLine cterm=NONE ctermbg=187 guibg=Grey100

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"Plugins Settings
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP
""""""""
" 'c' - the directory of the current file
" 'a' - the directory of the current file unless it is a subdirectory of the
"cwd
" 'r' - the nearest ancestor to the current file that contains one of these
"       directories or files: .git .hg .svn .bzr _darcs
" 'w' - modifier to 'r': start search from the cwd instead of the current
"       file's directory
" 0 or '' - disable the feature
let g:ctrlp_working_path_mode="ra"

"exclude files directories
set wildignore+=*/tmp/*,*/.git/*,*/.svn/*,*/.hg/* "directories
set wildignore+=*.swp,*.zip,*.bak,*.backup "files


" Tagbar
"""""""""
" let g:tagbar_autoclose = 1

"Vim Airline
""""""""""""
"Show all buffers in Tabs
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1

"Vim Airline Themes
"""""""""""""""""""
let g:airline_theme='deus'

"Vim easymotion
"""""""""""""""

"Disable default easymotion bindings
"let g:EasyMotion_do_mapping = 0
"
"Jump to anywhere you want with minimal keystrokes, with just one key binding
" `s{char}{label}`
"nmap s <Plug>(easymotion-overwin-f)

" or  `s{char}{char}{label}`
nmap s <Plug>(easymotion-overwin-f2)

"Turn on case insensitive feature
"let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
