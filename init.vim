" better colors
set termguicolors

" pasting from clipboard
set clipboard=unnamed

" unwritten changes to a file and open a new file
" without being forced to write or undo your changes first
set hidden

" use mouse
set mouse=a

" stop vim trying to syntax highlight long lines, typically found in minified
" files. This greatly reduces lag yet is still wide enough for large displays
set synmaxcol=500

" smoother scrolling when moving horizontally
set sidescroll=1

" line numbers
set number
" fancy numbers
set relativenumber

" don't highlight search
set nohlsearch

" start scrolling before cursor gets to the edge
set scrolloff=5
set sidescrolloff=15

" spaces, not tabs
set expandtab

" indent
set tabstop=4 shiftwidth=4

" don't wrap lines
set nowrap

" interactive replace
set inccommand=split

" ui update interval
" set updatetime=300

" leader
let mapleader = ","

" simple remaps
map q: :q
imap jj <Esc>
command W w
command Wq wq
command Wqall wqall
command Q q
command Qa qa
command Qall qall

" remap ; to :
nnoremap ; :

" disable ex mode
:nnoremap Q <Nop>

" scrolling with arrow keys
map <Down> <c-e>
map <Up> <c-y>

" inc a number with +
nnoremap + <c-a>
" dec a number with -
nnoremap - <c-x>

" plug Manager
call plug#begin('~/.vim/plugged')

" startup screen
Plug 'mhinz/vim-startify'

" zen mode
Plug 'junegunn/goyo.vim'

" smooth scrolling
Plug 'psliwka/vim-smoothie'

" projectTree
Plug 'scrooloose/nerdtree'

" color
Plug 'morhetz/gruvbox'

" color on brackets
Plug 'luochen1990/rainbow'
" color on yank
Plug 'machakann/vim-highlightedyank'

" status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" icons
Plug 'ryanoasis/vim-devicons'

" search plugin
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" show marks on left side
Plug 'kshenoy/vim-signature'

" change surroundings
Plug 'tpope/vim-surround'

" brackets autocomplete
Plug 'Raimondi/delimitMate'

" copy history
Plug 'vim-scripts/YankRing.vim'

" undo history
Plug 'mbbill/undotree'

" snippets
Plug 'honza/vim-snippets'

" git integration
Plug 'tpope/vim-fugitive'

" Typescript Syntax
Plug 'leafgarland/typescript-vim'

" autocompletion and diagnostic
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/diagnostic-nvim'

call plug#end()

" color scheme
set background=dark
colorscheme gruvbox

" airline settings
let g:airline_theme='zenburn'
let g:airline_powerline_fonts = 1
let airline#extensions#nvimlsp#error_symbol = '✘ '
let airline#extensions#nvimlsp#warning_symbol = '⚡'

" make bold on yank
highlight HighlightedyankRegion cterm=bold gui=bold

" disable background color, does not work with termguicolors
" highlight Normal ctermbg=None
" highlight SignColumn ctermbg=None
"
" set it manually if termguicolors enabled
highlight Normal guibg=#101010
highlight SignColumn guibg=#101010

" search git files
nnoremap <leader>p :GitFiles!<cr>
" search dir files
nnoremap <leader>f :Files!<cr>
" search buffers
nnoremap <leader>l :Buffers!<cr>
" show filetree
nnoremap <leader>n :NERDTreeToggle<cr>
" show yank history
nnoremap <leader>y :YRShow<cr>
" show undotree
nnoremap <leader>u :UndotreeToggle<cr>

" breakpoints
autocmd BufNewFile,BufRead *.py map <leader>b oimport ipdb; ipdb.set_trace()<ESC>
autocmd BufNewFile,BufRead *.rb map <leader>b obinding.pry<ESC>
autocmd BufNewFile,BufRead *.ex map <leader>b oIEx.pry<ESC>

" yankring history
let g:yankring_history_file = '.yankring_history'

" substitute latex symbols
" set conceallevel=1
" let g:tex_conceal="abdgm"

" remove cowsay from startify header
let g:startify_custom_header = ''

" dont show line numbers or relativenumbers when opening :terminal
au TermOpen * setlocal nonumber norelativenumber

" change to normal mode with escape while in :terminal
" but still close fzf with escape
if has("nvim")
  au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
  au FileType fzf tunmap <buffer> <Esc>
endif

" set completion options
set completeopt=menuone,noinsert,noselect

" trigger completion with c-n and c-p
imap <silent> <c-p> <Plug>(completion_trigger)
imap <silent> <c-n> <Plug>(completion_trigger)

" lsp features mapping
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K  <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gs <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0 <cmd>lua vim.lsp.buf.document_symbol()<CR>

" trigger completion with c-y
let g:completion_confirm_key = "\<C-y>"
" show info text in code
let g:diagnostic_enable_virtual_text = 1

" lua for lsp
lua <<EOF
  local on_attach_vim = function(client)
    require'completion'.on_attach(client)
    require'diagnostic'.on_attach(client)
  end
  require'nvim_lsp'.pyls.setup{on_attach=on_attach_vim}
  require'nvim_lsp'.tsserver.setup{on_attach=on_attach_vim}
  require'nvim_lsp'.rls.setup{on_attach=on_attach_vim}
EOF

" error and warning signs in signbar
sign define LspDiagnosticsErrorSign text=✘
sign define LspDiagnosticsWarningSign text=⚡
