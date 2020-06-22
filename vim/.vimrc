filetype plugin indent on
set tabstop=2 shiftwidth=2 expandtab
syntax on
 if has('persistent_undo')
   let target_path = expand('~/.config/vim-persisted-undo/')
   if !isdirectory(target_path)
     call system('mkdir -p ' . target_path)
   endif
   let &undodir = target_path
   set undofile
 endif
set hidden
set backspace=indent,eol,start
set nocompatible
set t_Co=256
set laststatus=0
hi! VertSplit cterm=NONE
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'valloric/matchtagalways'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'mru.vim'
Plugin 'airblade/vim-rooter'
Plugin 'scrooloose/nerdtree'
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
nmap <Leader>t :NERDTreeFind<CR>
nmap <Leader>h :split<CR>
nmap <Leader>q :q<CR>



