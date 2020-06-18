filetype plugin indent on
syntax on
set hidden
set backspace=indent,eol,start
set nocompatible
filetype plugin indent on
set rtp+=~/.vim/bundle/Vundle.vim
set t_Co=256
set laststatus=0
hi! VertSplit cterm=NONE
call vundle#begin()
Plugin 'VundleVim/vundle.vim'
Plugin 'valloric/matchtagalways'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mru.vim'
Plugin 'scrooloose/syntastic'
Plugin 'mattesgroeger/vim-bookmarks'
Plugin 'mileszs/ack.vim'
call vundle#end()            " required
filetype plugin indent on    " required
nmap <Leader>bl :BookmarkShowAll<CR>
nmap <Leader>bc :BookmarkAnnotate<CR>
nmap <Leader>bd :BookmarkClear<CR>
nmap <Leader>r :MRU<CR>
nmap <Leader>s :source ~/.vimrc<CR>
nmap <Leader>f :CtrlP<CR>
nmap <Leader>v :vsplit<CR>
nmap <Leader>h :split<CR>
nmap <Leader>q :q<CR>
