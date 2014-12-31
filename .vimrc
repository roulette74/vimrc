" Ctrl u move screen up 1/2 page
" Ctrl d move screen down 1/2 page
" Ctrl b move screen up 1 page
" Ctrl f move screen down 1 page
" zz move current line to the middle of the screen
" zt move current line to the top of the screen
" zb move current line to the bottom of the screen"
" H move cursor to the top of the screen
" M move cursor to the middle of the screen"
" L move cursor to the bottom of the screen
"
set nocompatible " no compatible with vi
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

" Color Settings
set colorcolumn=85
set t_Co=256
set cursorline
" set cursorcolumn
set ttyfast
set ruler
" set backspace=indent,eol,start

" Tab setting
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4

set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set scrolloff=3
set fenc=utf-8
set autoindent
set hidden
set noswapfile
set nowritebackup
" set encoding=utf-8

set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch

" move cursor under insert mode
" imap <c-j> <down>
" imap <c-k> <up>
" imap <c-l> <right>
" imap <c-h> <left>

" change leader key
let mapleader=","
imap jj <esc>

" vertical split window by ,w
" horizontal split: <c-w>s
" nmap <leader>w <c-w>c<c-w>l
" nmap <leader>wc <c-w>c
" nmap <leader>ww <c-w>w

" switch tab
nmap <leader>t gt
nmap <leader>r gT

" <leader>space quick save
nmap <leader><space> :w<cr>

" switch to current directory
" nmap <leader>q :execute "cd" expand("%:h")<CR>



" set numberwidth=4

" Spaces are better than a tab character
" set expandtab
" set smarttab

" keep all the temporary and backup files in one place
" set backup
" set backupdir=~/.vim/backup
" set directory=~/.vim/tmp


" :nmap jj <Esc>
" :vmap jj <Esc>
" :imap jj <Esc>

" python
" filetype plugin on
" let g:pydiction_location = 'C:\Program Files (x86)\Vim\vimfiles\ftplugin\pydiction\complete-dict'
" let g:pydiction_menu_height = 20

" nnoremap <silent> <C-S-Right> <c-w>l
" nnoremap <silent> <C-S-Left> <c-w>h
" nnoremap <silent> <C-S-Up> <c-w>k
" nnoremap <silent> <C-S-Down> <c-w>j

" NERDTree
" http://blog.longwin.com.tw/2009/02/vim-tree-explorer-nerdtree-plugin-2009/
nnoremap <silent> <F5> :NERDTree<CR>
""nnoremap <silent> <F5> NERDTreeToggle

" move lines up or down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

nnoremap <A-down> :m .+1<CR>==
nnoremap <A-up> :m .-2<CR>==
inoremap <A-down> <Esc>:m .+1<CR>==gi
inoremap <A-up> <Esc>:m .-2<CR>==gi
vnoremap <A-down> :m '>+1<CR>gv=gv
vnoremap <A-up> :m '<-2<CR>gv=gv

" Vundle Install
" git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" :BundleInstall "Install plugin
" :BundleInstall! "Update plugin
" :BundleClean " Clear plugin not in here
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
" let Vundle manage Vundle, required!
Bundle 'gmarik/vundle'
"Rails
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-bundler'
"Find Files in Dir
Bundle 'ctrlp.vim'
"Auto close Bracket
Bundle 'Autoclose'
"For HTML, CSS
Bundle 'ZenCoding.vim'
"Switch within bracket and html tags
Bundle 'matchit.zip'
"Show Trailing Whitespace
Bundle 'ShowTrailingWhitespace'
"Move Cursor
Bundle 'EasyMotion'
"Auto detect encoding of file
Bundle 'FencView.vim'
"Tree structure file explorer
Bundle 'The-NERD-tree'
"Add comment by ctrl-h
Bundle 'The-NERD-Commenter'
"Add large block of code by config
Bundle 'UltiSnips'
"Vertical alignment
Bundle 'Tabular'
"Autocomplete
" require cd ~/.vim/bundle/YouCompleteMe && ./install.sh --clang-completer
Bundle 'Valloric/YouCompleteMe'
filetype plugin indent on

" Always handy to scroll between open windows"
:map <F6> <C-W>w

" Automatically cd into the directory that the file is in:
set autochdir

" highlighting of the current line
set cul                                           " highlight current line
"hi CursorLine term=none cterm=none ctermbg=13      " adjust color

set tabpagemax=99
let $LANG = 'en'
set guifont=Consolas:h8
set nu
set shiftwidth=4
set ts=4
set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

filetype plugin indent on
syntax on
