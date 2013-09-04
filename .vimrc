""
"" Vundle
""
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

" vim-jsbeautify
Bundle 'maksimr/vim-jsbeautify'
Bundle 'einars/js-beautify'

" Misc
Bundle 'mileszs/ack.vim'
Bundle 'godlygeek/tabular'
Bundle 'LargeFile'

" Pair programming stuff - NOTE: Commented because I'm not yet ready to go :)
" Bundle 'benmills/vimux'
" Bundle 'pgr0ss/vimux-ruby-test'

filetype plugin indent on     " required!

""
"" End vundle
""

""
"" Vim general behaviour
""
set encoding=utf-8
set fileencoding=utf-8
set mouse=a
set ruler           " show line and column number of the cursor position
set number          " always show line numbers
set smarttab        " insert tabs on the start of a line according to shiftwidth, not tabstop
set tabstop=2       " a tab is 2 spaces
set softtabstop=2   " Spaces tat tab counts while editing
set expandtab       " convert tab in spaces
set shiftwidth=2    " number of space to use on autoindenting
set autoread        " read file again if it was changed outside of vim
set hidden          " Let me open new files without save changes
set backspace=indent,eol,start " Normal behaviour of backspace key
set title
set ttyfast
set autoread        " Reread files when have been changed outsido of Vim
set wmh=0           " Minium window size
set showmatch       " When a bracket is inserted, briefly jump to the matching one.
set showcmd         " Show command in the last line of the screen

"" Backups, temporary files and tags
" don't keep backup after close
set nobackup
" do keep a backup while working
set writebackup
" Store temporary files in a central spot
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Set tag files
set tags=tags,./tags,tmp/tags,./tmp/tags

" History and undo levels
set history=1000
set undolevels=1000

" Searches
set incsearch       " show search matches as you type
set hlsearch        " highlight search terms
set ignorecase      " case insensitive for patterns
set smartcase       " Use case-smart searching

" Maintain more context around the cursor
set scrolloff=3
set sidescrolloff=5

" Make file/command completion useful
" Show a wildmenu when try to find a command or file
set wildmenu
set wildmode=longest:full,full


""
"" Default browser
""

" Ubuntu
command -bar -nargs=1 OpenURL :!x-www-browser <args> 2>&1 >/dev/null &
" Mac OS X
" command -bar -nargs=1 OpenURL :!open <args> 2>&1 >/dev/null &


""
"" Filetypes behaviour
""
" Additional Ruby Syntax Highlighting
au BufRead,BufNewFile {Capfile,Gemfile,Rakefile,Thorfile,config.ru,.caprc,.irbrc,irb_tempfile*} set ft=ruby
" RDOC Syntax Highlighting
au BufRead,BufNewFile *.rd,*.rdoc     set filetype=rdoc
" Textile Syntax Highlighting
au BufRead,BufNewFile *.textile set filetype=textile
" jQuery Syntax Highlighting
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery


""
"" Mappings
""

" Maximize and minimize mappings (+ and -)
if bufwinnr(1)
  map + <C-W>_
  map - <C-W>=
endif

" Tabs
" tip 199 (comments) - Open actual buffer in a tab and then close
nmap t% <C-W>T
nmap td :tabclose<CR>
nmap tn :tabnew<CR>

" Paste from X clipboard to vim
vnoremap <C-C> "+y
inoremap <C-V> <ESC>"+gPi
" Commented to use Visual blocks
"noremap <C-V> <ESC>"+gP

" Indent with TAB and S-TAB keys
vnoremap <silent> <TAB> >gv
vnoremap <silent> <S-TAB> <gv

" Toggles
" Paste mode
nmap <silent> <F2> :set paste!<CR>:set paste?<CR>
" List
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <F3> :set list!<CR>:set list?<CR>
" Wrapping
nmap <silent> <F4> :set wrap!<CR>:set wrap?<CR>

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

" Clear search highlight
nmap <silent> ,/ :nohlsearch<CR>


""
"" Abbreviations
""
iabbrev rdebug    require 'ruby-debug'; Debugger.start; Debugger.settings[:autoeval] = 1; Debugger.settings[:autolist] = 1; debugger
iabbrev rrdebug   require 'ruby-debug'; Debugger.wait_connection = true; Debugger.start_remote ; Debugger.settings[:autoeval] = 1; Debugger.settings[:autolist] = 1; debugger;
iabbrev Lipsum     Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum


""
"" Commands
""
" Use :w!! to save with sudo if you're editing a readonly file
cmap w!! w !sudo tee % >/dev/null

" Trim file(remove blank spaces at EOL) - From hashrocket plugin
command! -bar -range=% Trim :<line1>,<line2>s/\s\+$//e


""
"" PlUGINS
""


""
"" NERDtree
""
let NERDTreeWinPos='right'

map <silent> <F8> :NERDTreeToggle<CR>
" map to find the current file in the tree
map <leader>r :NERDTreeFind<cr>


""
"" Tagbar
""
let g:tagbar_left = 1
let g:tagbar_compact = 1
let g:tagbar_usearrows = 1
let g:tagbar_sort = 1
let g:tagbar_width = 30
" let g:tagbar_ctags_bin = '/path/to/modified-exuberant-ctags/ctags'

nnoremap <silent> <F7> :TagbarToggle<CR>


""
"" CtrlP
""
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
"set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows


""
"" Matchit
""
runtime! plugin/matchit.vim
runtime! macros/matchit.vim


""
"" Ragtag
""
inoremap <M-o> <Esc>o
inoremap <C-j> <Down>
let g:ragtag_global_maps = 1


""
"" Gist
""
let g:gist_open_browser_after_post = 1
let g:gist_detect_filetype = 1
let g:gist_show_privates = 1
" let g:gist_browser_command = 'x-www-browser %URL%'


""
"" Tabular
""
if exists('g:tabular_loaded')
  AddTabularPattern! symbols         / :/l0
  AddTabularPattern! hash            /^[^>]*\zs=>/
  AddTabularPattern! chunks          / \S\+/l0
  AddTabularPattern! assignment      /^[^=|(^+=)]*/
  AddTabularPattern! comma           /^[^,]*,/l1
  AddTabularPattern! colon           /:\zs /l0
  AddTabularPattern! options_hashes  /:\w\+ =>/
endif


""
"" Rails
""
" Used by Rtags command
" let g:Tlist_Ctags_Cmd = '/path/to/modified-exuberant-ctags/ctags'
autocmd User Rails Rnavcommand factory test/factories -suffix=.rb -default=model()
autocmd User Rails Rnavcommand mtmodels test/models -suffix=_test.rb -default=model()


""
"" RSpec
""
let g:rspec_command = "!spec --drb {spec}"

map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>


""
"" jsbeautify
""
" map <c-f> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
