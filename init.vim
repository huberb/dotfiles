"
" NEOVIM CONFIG
"

" python path
let g:python3_host_prog = '/usr/local/bin/python3'
let g:python2_host_prog = '/usr/local/bin/python2'

" copying
set clipboard=unnamed

" numbers
set number
set relativenumber

" quit highlight search with enter
nnoremap <CR> :nohlsearch<CR><CR>

" folding
set foldlevel=99
set foldmethod=indent

" leader
let mapleader = ","

" ruby indentation is 2 spaces
set tabstop=2 shiftwidth=2 expandtab

" Plug Manager
call plug#begin('~/.vim/plugged')

  " update remote plugins for deoplete
  function! DoRemote(arg)
    UpdateRemotePlugins
  endfunction

  " ProjectTree
  Plug 'scrooloose/nerdtree'

  " Python autocomplete engine
  Plug 'zchee/deoplete-jedi'
  "
  " Ruby autocomplete engine
  Plug 'fishbullet/deoplete-ruby'

  " Ruby stuff
  Plug 'vim-ruby/vim-ruby'

  " javascript
  Plug 'carlitux/deoplete-ternjs'
  " linter
  Plug 'ternjs/tern_for_vim', {'do': 'npm install'} 

  " color
  Plug 'morhetz/gruvbox'
  Plug 'vim-airline/vim-airline'

  " searching
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'jremmen/vim-ripgrep'

  " show all methods in file, <leader>t
  Plug 'majutsushi/tagbar'

  " godlike autocomplete
  Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }

  " show marks on left side
  Plug 'kshenoy/vim-signature'

  " copy and paste
  Plug 'vim-scripts/YankRing.vim'

  " close brackets and quotes
  Plug 'Raimondi/delimitMate'

  " Rails integration
  Plug 'tpope/vim-rails'

  " linting Framework
  Plug 'neomake/neomake'

  " change surroundings
  Plug 'tpope/vim-surround'

  " snippets
  Plug 'garbas/vim-snipmate'
  Plug 'honza/vim-snippets'
  Plug 'MarcWeber/vim-addon-mw-utils'
  Plug 'tomtom/tlib_vim'

  " move commands
  Plug 'AndrewRadev/sideways.vim'

  " visual commands
  Plug 'terryma/vim-expand-region'

  " find and replace
  Plug 'brooth/far.vim'
  
call plug#end()

" colors
colo gruvbox
set background=dark

" Cursor shape
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
" insert mode - line
let &t_SI .= "\<Esc>[5 q"
" replace mode - underline
let &t_SR .= "\<Esc>[4 q"
" common - block
let &t_EI .= "\<Esc>[3 q"

" remapping
command W w
command Wq wq
command Q q
nnoremap ä {
nnoremap ö }
nnoremap ü <C-]>

" stop stupid window
map q: :q

" leader functions
nnoremap <leader>p :CtrlP<cr>
nnoremap <leader>t :TagbarToggle<cr>
nnoremap <leader>y :YRShow<cr>
nnoremap <leader>n :NERDTreeToggle<cr>

" capslock to f19 and f19 to esc cz osx
imap <F19> <Esc>

" map Y to y$
function! YRRunAfterMaps()
      nnoremap Y   :<C-U>YRYankCount 'y$'<CR>
endfunction
nnoremap Y y$

" scrolling with arrow keys
map <Down> <c-e>
map <Up> <c-y>

" yankring file
let g:yankring_history_dir = '~/.vim/bundle'

" close definitions on normal mode
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif


" Use deoplete.
let g:deoplete#enable_at_startup=1
let g:deoplete#enable_refresh_always=0
let g:deoplete#file#enable_buffer_path=1
let g:deoplete#auto_completion_start_length = 0
"
" javascript
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete
let g:tern#filetypes = [
                \ 'js',
                \ 'jsx',
                \ 'javascript.jsx',
                \ 'vue',
                \ '...'
                \ ]
" Use tern_for_vim.
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

" deoplete for python
let g:deoplete#sources#jedi#show_docstring = 1

" movement commands for sideways.vim
omap aa <Plug>SidewaysArgumentTextobjA
xmap aa <Plug>SidewaysArgumentTextobjA
omap ia <Plug>SidewaysArgumentTextobjI
xmap ia <Plug>SidewaysArgumentTextobjI

" movement commands for vim-expand-region
vmap v <Plug>(expand_region_expand)

nnoremap <c-h> :SidewaysLeft<cr>
nnoremap <c-l> :SidewaysRight<cr>

"autocmd! BufWritePost * Neomake
au BufWritePost *.rb Neomake mri " ruby
au BufWritePost *.py Neomake " python
au BufWritePost *.js Neomake " javascript
au BufWritePost *.c Neomake " c

" neomake settings
let g:neomake_open_list=0
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_jsx_enabled_makers = ['eslint']
let g:neomake_logfile = '/usr/local/var/log/neomake.log'
