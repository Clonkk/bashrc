call plug#begin()
" Nim
Plug 'alaviss/nim.nvim'
" Plug 'zah/nim.vim'
" Plug 'sheerun/vim-polyglot'

" Julia
Plug 'JuliaEditorSupport/julia-vim'

Plug 'dense-analysis/ale'
" LSP
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'

" Coc
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
"

" Deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }

" Nerd tree
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'jiangmiao/auto-pairs'

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
if !exists('g:vscode')
  Plug 'nathanaelkane/vim-indent-guides'
endif

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
"set relativenumber
" Smart case search
set ignorecase
set smartcase
set visualbell           " don't beep
set noerrorbells         " don't beep
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=200
set foldlevelstart=99

" Theme
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:nim_highlight_wait=100
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

" Linter & Fixers
let g:ale_linters = {
      \   'nim': ['nimcheck'],
      \   'python': ['flake8'],
      \}

let g:ale_fixers = {
      \   'nim': ['nimpretty'],
      \   'python': ['autopep8'],
      \}
call ale#Set('python_flake8_options', '--max-line-length=160')
call ale#Set('nim_nimpretty_options', '--maxLineLen:160')

let g:ale_enabled = 1
let g:ale_disable_lsp = 1
let g:ale_warn_about_trailing_whitespace = 1
let g:ale_linters_explicit = 1
let g:ale_set_loclist = 1
let g:ale_open_list = 0
let g:ale_set_quickfix = 0
let g:ale_completion_enabled = 0

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 0
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_filetype_changed = 1
let g:ale_lint_delay = 250
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

" Mapping
let mapleader=","
nmap <F12> <Plug>NimGoToDefVSplit
nmap <C-n> :NERDTreeTabsToggle<CR>
nnoremap <S-Left> :tabprevious<CR>
nnoremap <S-Right> :tabnext<CR>
noremap <F3> :Autoformat<CR>
nmap <F4> <Plug>(ale_fix)<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" LSP SETUP
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Use deoplete.
let g:deoplete#enable_at_startup = 1

call deoplete#custom#var('tabnine', {
\ 'line_limit': 500,
\ 'max_num_results': 20,
\ })

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
" let s:nimlspexecutable = "~/Workspace/localws/nimlsp/nimlsp"
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

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
imap <c-space> <Plug>(asyncomplete_force_refresh)

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nmap <silent> gh <plug>(lsp-hover)
    inoremap <buffer> <expr><c-f> lsp#scroll(+4)
    inoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Coc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd CursorHold * silent call CocActionAsync('highlight')
" nmap <leader>rn <Plug>(coc-rename)
"
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
"
" " Use <c-space> to trigger completion.
" if has('nvim')
"   inoremap <silent><expr> <c-space> coc#refresh()
" else
"   inoremap <silent><expr> <c-@> coc#refresh()
" endif
"
" " Make <CR> auto-select the first completion item and notify coc.nvim to
" " format on enter, <cr> could be remapped by other vim plugin
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"
" nnoremap <silent> K :call <SID>show_documentation()<CR>
" nnoremap <silent> gh :call <SID>show_documentation()<CR>
"
" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   elseif (coc#rpc#ready())
"     call CocActionAsync('doHover')
"   else
"     execute '!' . &keywordprg . " " . expand('<cword>')
"   endif
" endfunction
