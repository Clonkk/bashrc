call plug#begin()
" Nim
Plug 'alaviss/nim.nvim'
Plug 'dense-analysis/ale'

" LSP
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
" C    nmap <buffe>> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)OC
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}

" Nerd tree
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

"" Theme
" Plug 'morhetz/gruvbox', {'as': 'gruvbox'}
Plug 'kaicataldo/material.vim', { 'branch': 'main'  }
Plug 'sainnhe/gruvbox-material'

" Syntax
Plug 'itchyny/vim-gitbranch'
Plug 'ntpeters/vim-better-whitespace'
Plug 'cohama/lexima.vim'
Plug 'preservim/nerdcommenter'

" Better Visual Guide
Plug 'Chiel92/vim-autoformat'
Plug 'nathanaelkane/vim-indent-guides'

" Status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'

call plug#end()

filetype plugin indent on    " required
set hlsearch
set incsearch
set showmatch
set lazyredraw          " redraw only when we need to.
"Classic tabs / space conf
set tabstop=2
set shiftwidth=2
set ai
set si
set expandtab
" Set mouse scroll
set mouse=a
" Show line number
set number
set relativenumber
" Smart case search
set ignorecase
set smartcase
set visualbell           " don't beep
set noerrorbells         " don't beep
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=500

" Theme
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
syntax enable
set background=dark
let g:gruvbox_material_background = 'hard'
let g:gruv_material_palette = 'mix'

" colorscheme gruvbox
" colorscheme material
colorscheme gruvbox-material
highlight String guifg=#f8b015
highlight Identifier guifg=#acacee
highlight link nimSugModule NONE

" Always show the status line
set list
set laststatus=2
set clipboard+=unnamedplus

highlight ColorColumn ctermbg=darkgray
highlight StrangeWhitespace guibg=Red ctermbg=Red

" indent
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 1
let g:indentLine_enabled = 1
let g:indentLine_setColors = 1
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

hi DiffAdd          ctermbg=235  ctermfg=108  guibg=#262626 guifg=#87af87 cterm=reverse        gui=reverse
hi DiffChange       ctermbg=235  ctermfg=103  guibg=#262626 guifg=#8787af cterm=reverse        gui=reverse
hi DiffDelete       ctermbg=235  ctermfg=131  guibg=#262626 guifg=#af5f5f cterm=reverse        gui=reverse
hi DiffText         ctermbg=235  ctermfg=208  guibg=#262626 guifg=#ff8700 cterm=reverse        gui=reverse

let g:NERDTreeToggle = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '//','right': '' }, 'cpp': { 'left': '//','right': '' }, 'cxx': { 'left': '//','right': '' }, 'nim': {'left': '#', 'right':''}, 'py': {'left': '#', 'right':''}}
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0

" Airline
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#ale#error_symbol = '✘'
let g:airline#extensions#ale#warning_symbol = '➤'
let g:airline#extensions#ale#show_line_numbers = 1

let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_theme='angr'
let g:airline_solarized_bg='dark'

" Mapping
let mapleader=","
nmap <F12> <Plug>NimGoToDefVSplit
nmap <C-n> :NERDTreeTabsToggle<CR>
nnoremap <S-Left> :tabprevious<CR>
nnoremap <S-Right> :tabnext<CR>
noremap <F3> :Autoformat<CR>
nmap <F4> :Autoformat <Plug>(ale_fix)<CR>

"" LSP SETUP
au User asyncomplete_setup call asyncomplete#register_source({
    \ 'name': 'nim',
    \ 'whitelist': ['nim'],
    \ 'completor': {opt, ctx -> nim#suggest#sug#GetAllCandidates({start, candidates -> asyncomplete#complete(opt['name'], ctx, start, candidates)})}
    \ })

let g:lsp_log_verbose = 1
let g:lsp_completion_documentation_enabled = 1
let g:lsp_log_file = expand('/tmp/vim-lsp.log')
let g:asyncomplete_log_file = expand('/tmp/asyncomplete.log')
let g:asyncomplete_auto_popup = 1

let s:nimlspexecutable = "nimlsp"
if has('win32') || has('win64')
   let s:nimlspexecutable = "nimlsp.cmd"
   " Windows has no /tmp directory, but has $TEMP environment variable
   let g:lsp_log_file = expand('$TEMP/vim-lsp.log')
   let g:asyncomplete_log_file = expand('$TEMP/asyncomplete.log')
endif

if executable(s:nimlspexecutable)
   au User lsp_setup call lsp#register_server({
   \ 'name': 'nimlsp',
   \ 'cmd': {server_info->[s:nimlspexecutable]},
   \ 'whitelist': ['nim'],
   \ })
endif

if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'allowlist': ['python'],
        \ })
endif

" Linter & Fixers
let g:ale_linters = {
      \   'nim': ['nimcheck'],
      \   'python': ['flake8'],
      \}

let g:ale_fixers = {
      \   'nim': ['nimpretty'],
      \   'python': ['autopep8', 'yapf'],
      \}
call ale#Set('python_flake8_options', '--max-line-length=120')
call ale#Set('nim_nimpretty_options', '--maxLineLen:120')

let g:ale_enabled = 1
let g:ale_disable_lsp = 1
let g:ale_warn_about_trailing_whitespace = 1
let g:ale_linters_explicit = 1
let g:ale_set_loclist = 1
let g:ale_open_list = 0
let g:ale_set_quickfix = 0
let g:ale_completion_enabled = 0

let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_filetype_changed = 1
let g:ale_lint_delay = 100
let g:ale_list_window_size = 5
let g:ale_fix_on_save = 0

let g:ale_sign_error = '✘'
let g:ale_sign_warning = '➤'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_error_str = 'E'
" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_echo_msg_format = '[%severity%] %s '

highlight ALEErrorSign guifg=Red
highlight ALEWarningSign guifg=Yellow

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

"" LSP
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
nmap <silent> K <plug>(lsp-hover)
nmap <silent> gh <plug>(lsp-hover)
nmap <buffer> <leader>rn <plug>(lsp-rename)
nmap <buffer> gr <plug>(lsp-references)


