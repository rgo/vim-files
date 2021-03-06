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
Plugin 'Xuyuanp/nerdtree-git-plugin'
Bundle 'majutsushi/tagbar'

" General language plugins
Bundle 'scrooloose/syntastic'
Bundle 'Valloric/MatchTagAlways'
Bundle 'marijnh/tern_for_vim'

" Specific language plugins
Bundle 'editorconfig/editorconfig-vim'
Bundle 'vim-ruby/vim-ruby'
Bundle 'othree/html5.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'othree/javascript-libraries-syntax.vim'
Bundle 'maksimr/vim-jsbeautify'
Bundle 'petRUShka/vim-opencl'
Bundle 'SyntaxComplete'
Bundle 'kchmck/vim-coffee-script'

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

" Angular
Bundle 'burnettk/vim-angular'

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
Bundle 'stefandtw/quickfix-reflector.vim'

" Snippets
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'matthewsimo/angular-vim-snippets'

" LUA
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-lua-ftplugin'

" Theme
Plugin 'NLKNguyen/papercolor-theme'

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

" set diffopt+=vertical " diff vertical everywhere!

"" Theme
syntax on           " Syntax highlighting
set t_Co=256
" set background=dark
colorscheme Tomorrow-Night
highlight Normal ctermbg=black " I prefer black background

" colorscheme distinguished
" colorscheme PaperColor

"" Backups, temporary files and tags
" avoid swap, temp and backup files
set nobackup
set nowritebackup
set noswapfile
" don't keep backup after close
" set nobackup
" " do keep a backup while working
" set writebackup
" " Store temporary files in a central spot
" set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

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
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_load_gemfile = 1
autocmd FileType ruby,eruby let g:rubycomplete_use_bundler = 1



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
iabbrev bpry      binding.pry
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

let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
    \ }

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
      \   "command": "contracts",
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
      \   ]},
      \ "lib/spines/actions/*.rb": {
      \   "command": "domainaction",
      \   "template": "module Spines\n  module Actions\n    class %S\n    end\n  end\nend",
      \   "test": [
      \     "spec/lib/spines/actions/%s_spec.rb"
      \   ]},
      \ "lib/spines/arrangements/*.rb": {
      \   "command": "domainarrangement",
      \   "template": "module Spines\n  module Arrangement\n    class %S\n    end\n  end\nend",
      \   "test": [
      \     "spec/lib/spines/arrangements/%s_spec.rb"
      \   ]},
      \ "lib/spines/services/*.rb": {
      \   "command": "domainservices",
      \   "template": "module Spines\n  module Services\n    class %S\n    end\n  end\nend",
      \   "test": [
      \     "spec/lib/spines/services/%s_spec.rb"
      \   ]},
      \ "lib/infrastructure/*.rb": {
      \   "command": "domaininfrastructure",
      \   "template": "module Infrastructure\n  class %S\n    def self.for(model)\n      new(model)\n    end\n\n    private\n\n    def initialize(model)\n      @model = model\n    end\n  end\nend",
      \   "test": [
      \     "spec/lib/spines/services/%s_spec.rb"
      \   ]},
      \ }
let g:rails_gem_projections = {
      \ "sidekiq": {
      \   "app/workers/*.rb": {
      \   "command": "worker",
      \   "template": "class %S\n\n  queue_as = :default\n\n  def perform\n  end\nend"
      \   },
      \ },
      \ "resque": {
      \   "app/workers/*_job.rb": {
      \   "command": "worker",
      \   "template": "class %SJob\n\n  \n@queue = :main\ndef self.perform\n  end\nend"
      \   }
      \ },
      \ "activeadmin": {
      \   "app/admin/*.rb": {
      \   "command": "admin",
      \   "affinity": "model",
      \   "related": "app/models/%s.rb",
      \   "template": "ActiveAdmin.register %S do\n\n  # form do\n  # end\n\n  #menu parent: '', label: ''\n\n  # index do\n  # end\n\nend\n"
      \   }
      \ }
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
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
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
  \ , '<ng-pluralize> is not recognized!'
  \ , 'proprietary attribute "spn-'
  \ , 'proprietary attribute "required'
  \ , 'proprietary attribute "novalidate'
  \ , 'proprietary attribute "analytics'
  \ , 'proprietary attribute "placeholder'
  \ , 'proprietary attribute "hidden'
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

""
"" SyntaxComplete
""
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
        \ if &omnifunc == "" |
        \ setlocal omnifunc=syntaxcomplete#Complete |
        \ endif
endif

""
"" Angular
""
let g:angular_source_directory = 'app/scripts'
let g:angular_test_directory = 'test/spec'
let g:angular_find_ignore = ['build/', 'dist/']


""
"" The silver searcher
""
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>


"""
""" UltiSnips
"""
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" " If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"""
""" airline
"""
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tab_nr = 0

"""
""" fugitive
"""
nnoremap <leader>gs :Gstatus<CR>
" nnoremap <leader>gc :Gcommit -v -q<CR>
" nnoremap <leader>ga :Gcommit --amend<CR>
" nnoremap <leader>gt :Gcommit -v -q %<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gr :Gread<CR>
" nnoremap <leader>gw :Gwrite<CR><CR>
nnoremap <leader>gl :silent! Glog<CR>
" nnoremap <leader>gp :Ggrep<Space>
" nnoremap <leader>gm :Gmove<Space>
" nnoremap <leader>gb :Git branch<Space>
" nnoremap <leader>go :Git checkout<Space>
" nnoremap <leader>gps :Dispatch! git push<CR>
" nnoremap <leader>gpl :Dispatch! git pull<CR>
