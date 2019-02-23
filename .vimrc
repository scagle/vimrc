" Install Plug.vim if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plug.vim plugin manager
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline' 
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'         
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'terryma/vim-multiple-cursors'
Plug 'vimwiki/vimwiki'
call plug#end()

let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir
" Change MapLeader from \ to ,
let mapleader = ","

" Jumps back to last known position in a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Persistent Undo history
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

" Vim-Airline
augroup VimAirLine
    set t_Co=256
    let g:airline_theme='papercolor'
    let g:airline_solarized_bg='dark'
    let g:airline_powerline_fonts = 1

    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

    " unicode symbols
    let g:airline_left_sep = '»'
    let g:airline_left_sep = '▶'
    let g:airline_right_sep = '«'
    let g:airline_right_sep = '◀'
    let g:airline_symbols.linenr = '␊'
    let g:airline_symbols.linenr = '␤'
    let g:airline_symbols.linenr = '¶'
    let g:airline_symbols.branch = '⎇'
    let g:airline_symbols.paste = 'ρ'
    let g:airline_symbols.paste = 'Þ'
    let g:airline_symbols.paste = '∥'
    let g:airline_symbols.whitespace = 'Ξ'

    " airline symbols
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = ''
augroup end

"" NerdTree
augroup NERDTree
    nnoremap <silent> <leader>f :NERDTreeToggle<cr>
    let NERDTreeQuitOnOpen=1
augroup end

"" VimWiki
augroup VimWiki
    let g:vimwiki_list = [{'path':'~/.vimwiki/wiki', 'path_html':'~/.vimwiki/html/'}]
    " TODO: Change this to execute bash script or vim session for projects
    function! VimwikiLinkHandler(link)
        " Use Vim to open external files with the 'vfile:' scheme.  E.g.:
        "   1) [[vfile:~/Code/PythonProject/abc123.py]]
        "   2) [[vfile:./|Wiki Home]]
        let link = a:link
        if link =~# '^vfile:'
            let link = link[1:]
        else
            return 0
        endif
        let link_infos = vimwiki#base#resolve_link(link)
        if link_infos.filename == ''
            echomsg 'Vimwiki Error: Unable to resolve link!'
            return 0
        else
            exe 'tabnew ' . fnameescape(link_infos.filename)
            return 1
        endif
    endfunction
augroup end

" Custom Syntax Colors for certain files
augroup Colors
    "TODO: FIX THIS
    au!
    au FileType cmake setlocal commentstring=$\ %s
augroup end


" Vim Settings
syntax on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
" Set line numbers
set number
" Highlight Search and Increment Search
set hlsearch 
set incsearch 
" Set Colorscheme
colorscheme default

" Vim mappings:
"" For saving keystrokes on split windows
nnoremap <C-J> <C-W><C-J> 
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"" Vimrc customization
nnoremap <silent> <leader>ev :tabnew $MYVIMRC<cr> 
nnoremap <silent> <leader>sv :source $MYVIMRC<cr>
"" Fold Helpers
nnoremap <silent> <leader>I :set foldmethod=indent<cr>zX<cr>
nnoremap <silent> <leader>S :set foldmethod=syntax<cr>zX<cr>
"" Alternate quicker esc
inoremap jk <esc>
"" Etc
nnoremap <silent> <leader>W :set wrap!<cr>
nnoremap <silent> <leader>cc :set cursorcolumn!<cr> 
nnoremap <silent> <space> :noh<return><esc>
nnoremap <silent> <leader>b :ls<CR>:b<Space>
