execute pathogen#infect()
syntax on
set hlsearch
set incsearch
set showmatch
filetype plugin indent on
set lazyredraw          " redraw only when we need to.
"Classic tabs / space conf
set tabstop=4
set shiftwidth=4
set ff=unix
set ai
set si
set expandtab
" Show line number
set number
" Smart case search
set ignorecase
set smartcase
set visualbell           " don't beep
set noerrorbells         " don't beep
" Always show the status line
set laststatus=2
map <F7> mzgg=G`z
" Format the status line
set wildmenu
set showcmd
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
set statusline="%f%m%r%h%w [%Y] [0x%02.2B]%< %F%=%4v,%4l %3p%% of %L"
" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun
if has("autocmd")
    autocmd BufWritePre *.c,*.cpp,*.txt,*.py,*.wiki,*.sh,*.coffee, *.lua, *.java :call CleanExtraSpaces()
endif
