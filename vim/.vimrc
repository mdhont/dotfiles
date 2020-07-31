filetype plugin indent on
set tabstop=2 shiftwidth=2 expandtab noshowmode laststatus=0 noshowcmd
set nocompatible hidden
set backspace=indent,eol,start
set t_Co=256
set directory^=$HOME/.vim/tmp//
syntax on
 if has('persistent_undo')
   let target_path = expand('~/.config/vim-persisted-undo/')
   if !isdirectory(target_path)
     call system('mkdir -p ' . target_path)
   endif
   let &undodir = target_path
   set undofile
 endif
let g:syntastic_xml_xmllint_args = "--schema ~/.InstallBuilder.xsd"
hi! clear VertSplit
hi! clear SignColumn
hi! clear SignColumn
hi! clear LineNr
highlight clear SignColumn
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red
highlight GitGutterChangeDelete ctermfg=yellow
hi! GitGutterAdd ctermbg=NONE
hi! GitGutterChange ctermbg=NONE
hi! GitGutterDelete ctermbg=NONE
hi! GitGutterChangeDelete ctermbg=NONE
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'valloric/matchtagalways'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'mru.vim'
Plugin 'airblade/vim-rooter'
Plugin 'junegunn/fzf'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'mattesgroeger/vim-bookmarks'
Plugin 'mileszs/ack.vim'
call vundle#end()            " required
filetype plugin indent on    " required
nmap <Leader>bl :BookmarkShowAll<CR>
nmap <Leader>bc :BookmarkAnnotate<CR>
nmap <Leader>bd :BookmarkClear<CR>
nmap <Leader>r :CtrlPMRUFiles<CR>
nmap <Leader>. :CtrlPBuffer<CR>
nmap <Leader>s :source ~/.vimrc<CR>
nmap <Leader>f :CtrlP<CR>
nmap <Leader>p :CtrlP
nmap <Leader>v :vsplit<CR>
nmap <Leader>t :NERDTreeFind<CR>
nmap <Leader>i :PluginInstall<CR>
nmap <Leader>a :AckFromSearch<CR>
nmap <Leader>h :split<CR>
nmap <Leader>q :q<CR>
nmap <Leader>o :only<CR>
nmap <Leader>1 <C-W><left>
nmap <Leader>2 <C-W><right>
nmap <Leader>3 <C-W><up>
nmap <Leader>4 <C-W><down>
