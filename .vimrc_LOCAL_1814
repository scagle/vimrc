" Install Plug.vim if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plug.vim plugin manager
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')
"" Necessary
Plug 'scrooloose/nerdtree'          " Navigate files with filetree
Plug 'godlygeek/tabular'            " Align text in many ways
Plug 'terryma/vim-multiple-cursors' " Find/Replace/Manipulate
Plug 'vimwiki/vimwiki'              " For notetaking/general documenting

"" Aesthetics
Plug 'vim-airline/vim-airline'        " For sleek airline bar at bottom
Plug 'vim-airline/vim-airline-themes' " For more themes with airline bar
Plug 'airblade/vim-gitgutter'         " Use it for viewing what's changed
Plug 'scagle/vim-tba'                 " My First Real Plugin for tba

"" Experimental
Plug 'tpope/vim-surround'             " Trying to get used to it

"" Super Experimental
Plug 'junegunn/fzf', {'do': './install --all'}  
Plug 'junegunn/fzf.vim'  
Plug 'jremmen/vim-ripgrep'  
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'lervag/vimtex'
call plug#end()

let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir
" Change MapLeader from \ to ,
let mapleader = ","
let maplocalleader = "\\"

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
    " let g:airline_solarized_bg='dark'
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
augroup END

"" VimWiki
augroup VimWiki
    let g:vimwiki_list = [{'path':'~/.vimwiki/wiki', 'path_html':'~/.vimwiki/html/'}]
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

    " mapping to open wiki link in new tab (urxvt doesnt support default map)
    nmap <Leader>nt <Plug>VimwikiTabnewLink
augroup END

augroup UltiSnips
    " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<tab>"
    let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
    " If you want :UltiSnipsEdit to tab your window.
    let g:UltiSnipsEditSplit="tabdo"
    nnoremap <silent><leader>eu :UltiSnipsEdit <cr>
    let g:UltiSnipsSnippetDirectories=[$HOME."/.vim/plugged/my-snippets/UltiSnips"]
augroup END

augroup FZF
    function! s:buflist()
      redir => ls
      silent ls
      redir END
      return split(ls, '\n')
    endfunction

    function! s:bufopen(e)
      execute 'buffer' matchstr(a:e, '^[ 0-9]*')
    endfunction

    nnoremap <silent> <leader>b :call fzf#run({
    \   'source':  reverse(<sid>buflist()),
    \   'sink':    function('<sid>bufopen'),
    \   'options': '+m',
    \   'down':    len(<sid>buflist()) + 2
    \ })<CR>
augroup END

augroup Vimtex
    let g:tex_flavor = 'latex'
augroup END
" Use System Clipboard
set clipboard+=unnamedplus
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
set lazyredraw 
" Set Colorscheme
colorscheme default
highlight Comment ctermfg=Gray

" Vim mappings:
"" For saving keystrokes on split windows
nnoremap <C-J> <C-W><C-J> 
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"" Vimrc customization
" ACTUALVIMRC environment variable is set in ~/.bashrc as ~/.vimrc
" Temporary fix for Neovim's MYVIMRC jumping to ~/.config/neovim/init.vim
nnoremap <silent> <leader>ev :tabnew $ACTUALVIMRC<cr> 
nnoremap <silent> <leader>sv :source $MYVIMRC<cr>
"" Fold Helpers
nnoremap <silent> <leader>I :set foldmethod=indent<cr>zX<cr>
nnoremap <silent> <leader>S :set foldmethod=syntax<cr>zX<cr>
"" Etc
nnoremap <silent> <leader>W :set wrap!<cr>
nnoremap <silent> <leader>cc :set cursorcolumn!<cr> 
noremap <silent> <space> :noh<return><esc>
nnoremap <leader>sc :setlocal spell! spelllang=en_us <cr>
"nnoremap <silent> <leader>b :ls<CR>:b<Space>
"nnoremap <silent> <leader>h :exec "normal! gg0O\<ESC>" . '/module\s[a-z|A-Z|_|-|\s]\+(' . "\<CR>O\<ESC>VggxO\<ESC>head\<TAB>:w\<CR>"
"" Alternate Escape (Can't live without it now, by far one of my favorite shortcuts)
""  (Blame this guy not me: http://learnvimscriptthehardway.stevelosh.com/chapters/10.html)
inoremap jk <esc>

augroup FileSpecficMappings
    autocmd! FileSpecficMappings
    function! FindPrevPattern(pattern)
        return filter([search(a:pattern, 'bnW'), line('.')], 'v:val')[0].'G'
    endfunction
    " Update Header: Creates/Updates headers in verilog files
    autocmd FileType verilog nnoremap <silent> <leader>uh 
            \ mm/module\s\([a-z]\\|[A-Z]\\|\s\\|_\\|-\\|[0-9]\)\+(<CR>
            \ :exec "normal" . FindPrevPattern('DESC:')<CR>
            \ O<ESC>VggxO<ESC>0Dihead <ESC>:call UltiSnips#ExpandSnippet()<CR><ESC>:w<CR>`m
    autocmd FileType vimwiki nnoremap <silent> <leader>oc :Vimwiki2HTMLBrowse<cr> 
augroup END

