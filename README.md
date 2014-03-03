# vim-files

Vim configuration files


## Dependencies

* Vim :P
* Ack (ack-grep in ubuntu and debian based systems)
* cURL
* Exuberant ctags


## Installation

1. git clone git@github.com:rgo/vim-files.git
2. Link vim-files path as .vim at $HOME
3. Link vim-files/.vimrc at $HOME
4. Run vim
5. :BundleInstall


Note for Windows users:

* .vimrc should be linked as \_vimrc
* .vim should be linked as vimfiles
* Check path related variables to format them as Windows want
* No windows warranty support (I'll do my best)

## Plugins

### CtrlP

Full path fuzzy file, buffer, mru, tag, ... finder with an intuitive interface.
Invoke it with <c-p>


### NERDTree

<F8>       Toggle NERDTree
<leader>r  Open NERDTree and find the current file in the tree

You can manipulate tree filesystem with "m"(create, delete, move and copy files/directories)


### Tagbar

Tagbar is a plugin for browsing the tags of source code files. I replaced TagList with this plugin (IMHO work much better). Let you navigate and see tag signature.

<F7>     Toggle Tagbar
<Space>  At Tagbar show tag signature


### Vim-RSpec

<Leader>t  Run current spec file
<Leader>s  Run nearest spec
<Leader>l  Run last spec

### Gist

:Gist     Create a new public Gist with current buffer
:Gist -p  Create a new private Gist with current buffer
:Gist -l  Gist lists and let you select them to edit

Recommend read help: help gist :)

## Mappings and commands

### Windows

* +   For maximizing
* -   To make all windows equally high and wide (useful after maximizing)

### Tabs

* t%  Move buffer to new tab
* tn  New tab
* td  Close tab

### Toggles

* F2  pastemode
* F3  Display or not unprintable characters
* F4  wrap or not wrap this is the question

### Misc

* TAB   indent selected text
* Q     Format current paragraph
* ,/    Clear search highlight
* w!!   Save buffer with sudo
* Trim  Remove blank spaces at end of lines

## Abbreviations

* rdebug   Require ruby-debug and call the debugger
* rrdebug  Same as before but ready to remote debugging
* Lipsum   Lorem ipsum dolor sit amet, consectetur adipisicing elit...
