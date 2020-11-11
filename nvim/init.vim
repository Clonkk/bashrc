call plug#begin()
" Nim
Plug 'alaviss/nim.nvim'
" Plug 'zah/nim.vim'

Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" Julia
" Plug 'JuliaEditorSupport/julia-vim'
" Python
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

" Nerd tree
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-fugitive'

" Analysis
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'zchee/deoplete-jedi'
Plug 'dense-analysis/ale'

" Line & git
Plug 'itchyny/vim-gitbranch'
Plug 'ntpeters/vim-better-whitespace'
Plug 'airblade/vim-gitgutter'

"" Theme
" Plug 'morhetz/gruvbox', {'as': 'gruvbox'}
Plug 'kaicataldo/material.vim', { 'branch': 'main'  }
Plug 'sainnhe/gruvbox-material'

" Syntax
" Plug 'jiangmiao/auto-pairs'
" Plug 'vim-syntastic/syntastic'
Plug 'cohama/lexima.vim'
Plug 'preservim/nerdcommenter'
Plug 'nathanaelkane/vim-indent-guides'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

au User asyncomplete_setup call asyncomplete#register_source({
    \ 'name': 'nim',
    \ 'whitelist': ['nim'],
    \ 'completor': {opt, ctx -> nim#suggest#sug#GetAllCandidates({start, candidates -> asyncomplete#complete(opt['name'], ctx, start, candidates)})}
    \ })

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

" Smart case search
set ignorecase
set smartcase
set visualbell           " don't beep
set noerrorbells         " don't beep

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
set laststatus=2
set clipboard+=unnamedplus
highlight ColorColumn ctermbg=darkgray

" Delete trailing white space on save, useful for some filetypes ;)
autocmd BufWritePre * StripWhitespace
set list
"set listchars=tab:▸·

au BufNewFile,BufRead *.py
    \ set expandtab       " replace tabs with spaces
    \ set autoindent      " copy indent when starting a new line
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4

highlight StrangeWhitespace guibg=Red ctermbg=Red
let g:indent_guides_enable_on_vim_startup = 1
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
" let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
let g:deoplete#enable_at_startup = 1
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

let s:nimlspexecutable = "nimlsp"
let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('/tmp/vim-lsp.log')

let g:asyncomplete_log_file = expand('/tmp/asyncomplete.log')
let g:asyncomplete_auto_popup = 1

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


function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Linter & Fixers
let g:ale_linters = {
      \   'nim': ['nimlsp', 'nimcheck'],
      \   'python': ['flake8, pylint'],
      \}
let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'nim': ['nimpretty'],
      \   'python': ['yapf'],
      \}

call ale#Set('python_flake8_options', '--max-line-length=120')
call ale#Set('nim_nimpretty_options', '--maxLineLen:120')
let g:ale_linters_explicit = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 0
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '>'

highlight ALEErrorSign guifg=Red
highlight ALEWarningSign guifg=Yellow

let g:airline_theme='wombat'
let g:airline_solarized_bg='dark'

" git_gutter
let g:gitgutter_enabled = 0
let g:gitgutter_highlight_lines = 0
let g:gitgutter_async = 0
let g:gitgutter_preview_win_floating = 0
set updatetime=100

" Mapping
let mapleader=","
nmap <F12> <Plug>(ale_fix)
nmap <C-n> :NERDTreeTabsToggle<CR>
nnoremap <S-Left> :tabprevious<CR>
nnoremap <S-Right> :tabnext<CR>

