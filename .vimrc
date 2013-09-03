set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

"" My Bundles here:

" File explorer
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'majutsushi/tagbar'

" Specific language plugins
Bundle 'vim-ruby/vim-ruby'
Bundle 'pangloss/vim-javascript'
Bundle 'othree/html5.vim'
Bundle 'SyntaxComplete'

" Testing related stuff
Bundle 'thoughtbot/vim-rspec'

" tpope awesome plugins
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-pathogen'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'

" Gist from Vim
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'

" Misc
Bundle 'mileszs/ack.vim'
Bundle 'godlygeek/tabular'
Bundle 'LargeFile'

" Pair programming stuff - NOTE: Commented because I'm not yet ready to go :)
" Bundle 'benmills/vimux'
" Bundle 'pgr0ss/vimux-ruby-test'

filetype plugin indent on     " required!

""
