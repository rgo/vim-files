""
"" Vundle
""
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

"" My Bundles here:

" File explorer
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'majutsushi/tagbar'

" General language plugins
Bundle 'scrooloose/syntastic'

" Specific language plugins
Bundle 'vim-ruby/vim-ruby'
Bundle 'othree/html5.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'othree/javascript-libraries-syntax.vim'
Bundle 'maksimr/vim-jsbeautify'
Bundle 'petRUShka/vim-opencl'
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
Bundle 'tpope/vim-projectionist'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'

" Rails - i18n
Bundle 'stefanoverna/vim-i18n'

" Gist from Vim
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'

" Misc
Bundle 'Raimondi/delimitMate'
Bundle 'rking/ag.vim'
Bundle 'godlygeek/tabular'
Bundle 'LargeFile'
Bundle 'bling/vim-airline'
Bundle 'kris89/vim-multiple-cursors'

" C
" Bundle 'Conque-GDB'

" Pair programming stuff - NOTE: Commented because I'm not yet ready to go :)
" Bundle 'benmills/vimux'
" Bundle 'pgr0ss/vimux-ruby-test'

" All of your Plugins must be added before the following line
call vundle#end()            " required
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
set shiftwidth=2    " number of space to use on autoindenting
set expandtab       " convert tab in spaces
set autoread        " read file again if it was changed outside of vim
set hidden          " Let me open new files without save changes
set backspace=indent,eol,start " Normal behaviour of backspace key
set title
set ttyfast
set autoread        " Reread files when have been changed outsido of Vim
set wmh=0           " Minium window size
set showmatch       " When a bracket is inserted, briefly jump to the matching one.
set showcmd         " Show command in the last line of the screen
set laststatus=2    " Status line always

"" Theme
syntax on           " Syntax highlighting
set t_Co=256
colorscheme desert

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
set smartcase       " Use case-smart searching
set ignorecase      " case insensitive for patterns

" Maintain more context around the cursor
set scrolloff=3
set sidescrolloff=5

" Make file/command completion useful
" Show a wildmenu when try to find a command or file
set wildmenu
set wildmode=longest:full,full

""
"" Omin completion functions
""
"" See :help ft-ruby-omni and :help i_CTRL-X_CTRL-O for more details.
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1
let g:rubycomplete_load_gemfile = 1
let g:rubycomplete_use_bundler = 1


""
"" Default browser
""
if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    command -bar -nargs=1 OpenURL :!open <args> 2>&1 >/dev/null &
  else
    command -bar -nargs=1 OpenURL :!x-www-browser <args> 2>&1 >/dev/null &
  endif
endif



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

au BufRead,BufNewFile   *.c,*.h,*.java set noic cin noexpandtab

""
"" javascript-libraries-syntax
""
let g:used_javascript_libs = 'angularjs, angularui, jquery, jasmine, requirejs'


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

" Vertical split to edit my vimrc file
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" Source my vimrc file
nnoremap <leader>sv :source $MYVIMRC<cr>


""
"" Abbreviations
""
iabbrev rdebug    require 'debug'
iabbrev Lipsum     Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum


""
"" Commands
""
" Use :w!! to save with sudo if you're editing a readonly file
cmap w!! w !sudo tee % >/dev/null

" Trim file(remove blank spaces at EOL) - From hashrocket plugin
command! -bar -range=% Trim :<line1>,<line2>s/\s\+$//e
" Find trailing whitespace
" match ErrorMsg '\s\+$'
let c_space_errors = 1
let ruby_space_errors = 1

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
let g:ctrlp_custom_ignore = {
      \ 'dir':  'git\|hg\|svn\|node_modules\|dist',
      \ }
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
"" Rails
""
let g:rails_projections = {
      \ "app/domain/*_contract.rb": {
      \   "command": "domain",
      \   "test": [
      \     "test/domain/%s_contract_test.rb",
      \     "spec/domain/%s_contract_spec.rb"
      \   ]
      \ },
      \ "spec/factories/*.rb": {
      \   "command": "factory",
      \   "related": [
      \     "app/models/%s.rb"
      \   ]
      \ },
      \ "test/factories/*.rb": {
      \   "command": "factory",
      \   "related": [
      \     "app/models/%s.rb"
      \   ]
      \ },
      \ "app/decorators/*_decorator.rb": {
      \   "command": "decorator",
      \   "test": [
      \     "test/domain/%s_decorator_test.rb",
      \     "spec/domain/%s_decorator_spec.rb"
      \   ]}
      \ }


""
"" RSpec
""
let g:rspec_command = "!bundle exec rspec {spec}"
let g:rspec_runner = "os_x_iterm"

map <Leader>c :call RunCurrentSpecFile()<CR>
map <Leader>n :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>


""
"" ConqueGDB
""
let g:ConqueGdb_SrcSplit = 'above'

""
"" vim-i18n
""
vmap <Leader>z :call I18nTranslateString()<CR>

""
"" syntastic
""
let g:syntastic_ruby_checkers=['rubocop', 'mri']
let g:syntastic_js_checkers=['jshint']
let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_json_checkers=['jsonlint']
let g:syntastic_javascript_jshint_args='--config ~/.jshintrc'
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
" Ignore errors of proprietary attribute ng (html angular views) among others
let g:syntastic_html_tidy_ignore_errors = [
  \ 'trimming empty <i>'
  \ , 'trimming empty <span>'
  \ , 'unescaped & which should be written as &amp;'
  \ , ' proprietary attribute "ng-'
  \ , '<spn-'
  \ , 'discarding unexpected </spn-'
  \ , '<alert> is not recognized!'
  \ , 'discarding unexpected <alert>'
  \ , 'discarding unexpected </alert>'
  \ ]

let g:syntastic_mode_map = { 'mode': 'passive',
      \ 'active_filetypes': ['ruby', 'javascript', 'scss', 'html']
      \ }
""
"" JsBeautify
""
" for javascript
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
