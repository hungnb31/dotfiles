call plug#begin()
" Some Git stuff
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
" Editor Config
Plug 'editorconfig/editorconfig-vim'
" Language support things
Plug 'pangloss/vim-javascript'
Plug 'jbgutierrez/vim-babel'
Plug 'mattn/webapi-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'plasticboy/vim-markdown'
Plug 'sheerun/vim-polyglot'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'cakebaker/scss-syntax.vim'
Plug 'ap/vim-css-color'
" LSP support
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Fancy UI stuff
Plug 'mhartington/oceanic-next'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
" Auto root folder switcher
Plug 'airblade/vim-rooter'
" Improving editing experience
Plug 'camspiers/lens.vim'
Plug 'mattn/emmet-vim'
Plug 'kien/ctrlp.vim'
Plug 'alvan/vim-closetag'
Plug 'godlygeek/tabular'
Plug '907th/vim-auto-save'
Plug 'vim-scripts/matchit.zip'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'haya14busa/incsearch.vim'
Plug 'tpope/vim-abolish' " For case perserved subtitue :%S
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
call plug#end()

filetype plugin indent on

" ctrp.vim configs
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git' " ignore some dirs
let g:ctrlp_prompt_mappings = { 'PrtExit()': ['<esc>', '<c-c>', '<c-g>', 'q'] }

" TSX Pretty configs
let g:vim_jsx_pretty_disable_tsx = 1

" NERDTree highlight
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

" NERDTree config
let g:NERDTreeMinimalUI=1
let g:NERDTreeShowHidden=1
let g:NERDTreeIgnore=['node_modules', '.git']

" Disable auto comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" ----- AUTO CLOSETAG CONFIG -----
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.jsx'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*js'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml,js,jsx'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx,js'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)

let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'
" ----- AUTOCLOSE TAG -----

" Auto remove trailing spaces
autocmd BufWritePre * %s/\s\+$//e

set encoding=UTF-8
set shiftwidth=2
set tabstop=2
set hidden
set nobackup
set nowritebackup
set mouse=a " enable mouse for all mode
set wildoptions=pum
set pumblend=20
set cursorline
set relativenumber
set expandtab
set smartindent
set autoindent
set autoread
set cindent
set showmatch

set foldmethod=indent
set foldlevel=99

let g:is_posix = 1

set noswapfile
set nojoinspaces
set nowrap
set number
set ttyfast
set laststatus=2
set termguicolors
set ignorecase

if !has('gui_running')
  set ttimeout
  augroup NoInsertKeycodes
    autocmd!
    au InsertEnter * set ttimeoutlen=0
    au InsertLeave * set ttimeoutlen=-1 "<--- default value; also try 100 or something
  augroup END
endif

" Key binding
let mapleader=" "
nnoremap <C-k> :m .-2<CR>
nnoremap <C-j> :m .+1<CR>
nnoremap <Leader><Leader>q :q<CR>
nnoremap <Leader>q :nohlsearch<CR>
nnoremap <Leader>l :vsplit<CR>
nnoremap <Leader>wh :wincmd h<CR>
nnoremap <Leader>wl :wincmd l<CR>
nnoremap <Leader>wk :wincmd k<CR>
nnoremap <Leader>wj :wincmd j<CR>
nnoremap <Leader>n :NERDTree<CR>
nnoremap <Leader>f :NERDTreeFind<CR>
" Coc Config
nnoremap <Leader>gd :call CocAction('jumpDefinition', 'drop')<CR>
nnoremap <Leader><Leader>r :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>m :CocCommand prettier.formatFile<CR>
"Buffer
nnoremap <Leader>tn :tabn<CR>
nnoremap <Leader>tp :tabp<CR>
nnoremap <Leader>tc :tabe<CR>
nnoremap <Leader>tx :tabclose<CR>

" ----- COC SETTINGS -----
inoremap <silent><expr> <TAB>
  \ pumvisible() ? coc#_select_confirm() :
  \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

function! s:check_back_space() abort
let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `<Leader>e` to navigate diagnostics
nmap <silent> <Leader>e <Plug>(coc-diagnostic-next)

let g:coc_snippet_next = '<tab>'
" ----- END COC SETTINGS -----

" Colorscheme setup
set t_Co=256
syntax on
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
let g:airline_theme = 'base16'
let g:airline#extensions#tabline#show_splits = 0
colorscheme OceanicNext

" Fix cursorline
function! s:CustomizeColors()
  if has('guirunning') || has('termguicolors')
    let cursorline_gui=''
    let cursorline_cterm='ctermfg=white'
  else
    let cursorline_gui='guifg=white'
    let cursorline_cterm=''
  endif
  exec 'hi CursorLine ' . cursorline_gui . ' ' . cursorline_cterm
endfunction

augroup OnColorScheme
  autocmd!
  autocmd ColorScheme,BufEnter,BufWinEnter * call s:CustomizeColors()
augroup END
" End Fix cursorline

" Map ESC to jj
:imap jj <Esc>
" Run commands with semicolon
nnoremap ; :
