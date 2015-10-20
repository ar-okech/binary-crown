" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Pre vundle --- {{{

" TODO: this may not be in the correct place. It is intended to allow overriding <Leader>.
" source ~/.vimrc.before if it exists.
if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif

" }}}

" Vundle init --- {{{

filetype off

set runtimepath+=c:\users\okecrich\.vim\bundle\Vundle.vim
set runtimepath+=~/.vim/bundle/vundle

call vundle#begin()

Plugin 'gmarik/vundle'

" Ruby, Rails, Rake...
" Plugin 'astashov/vim-ruby-debugger'
" Plugin 'ecomba/vim-ruby-refactoring'
" Plugin 'skwp/vim-ruby-conque'
" Plugin 'tpope/vim-rails'
" Plugin 'tpope/vim-rake'
" Plugin 'tpope/vim-rvm'
" Plugin 'vim-ruby/vim-ruby'
" Plugin 'vim-scripts/Specky'
" Plugin 'ck3g/vim-change-hash-syntax'

" Other languages
" Plugin "briancollins/vim-jst"
" Plugin "pangloss/vim-javascript"

" Html, Xml, Css, Markdown...
Plugin 'claco/jasmine.vim'
Plugin 'digitaltoad/vim-jade'
Plugin 'groenewege/vim-less'
" Plugin 'itspriddle/vim-jquery'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'kchmck/vim-coffee-script'
Plugin 'nelstrom/vim-markdown-preview'
Plugin 'skwp/vim-html-escape'
Plugin 'slim-template/vim-slim'
Plugin 'timcharper/textile.vim'
Plugin 'tpope/vim-haml'
Plugin 'wavded/vim-stylus'

" Git related...
" Plugin 'gregsexton/gitv'
" Plugin 'mattn/gist-vim'
" Plugin 'skwp/vim-git-grep-rails-partial'
" Plugin 'tjennings/git-grep-vim'
" Plugin 'tpope/vim-fugitive'
" Plugin 'tpope/vim-git'
" Plugin 'sjl/threesome.vim'
" Plugin 'phleet/vim-mercenary'

" General text editing improvements...
Plugin 'AndrewRadev/splitjoin.vim'
"Plugin 'Raimondi/delimitMate'
Plugin 'Shougo/neocomplcache'
Plugin 'briandoll/change-inside-surroundings.vim'
Plugin 'garbas/vim-snipmate'
Plugin 'godlygeek/tabular'

if has("python")
   Plugin 'sirver/ultisnips'
endif

Plugin 'honza/vim-snippets'
Plugin 'nelstrom/vim-visual-star-search'
Plugin 'skwp/vim-easymotion'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'tomtom/tcomment_vim'
"Plugin 'tpope/vim-bundler'
Plugin 'vim-scripts/IndexedSearch'
Plugin 'vim-scripts/camelcasemotion'
Plugin 'vim-scripts/matchit.zip'

" General vim improvements
Plugin 'MarcWeber/vim-addon-mw-utils'
"Plugin 'bogado/file-line'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'mattn/webapi-vim'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'sjl/gundo.vim'
Plugin 'skwp/YankRing.vim'
Plugin 'skwp/greplace.vim'
Plugin 'skwp/vim-conque'
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
" Don't add the below git repo makes gvim not boot
"Plugin 'vim-scripts/AutoTag'
Plugin 'vim-scripts/lastpos.vim'
" Plugin 'vim-scripts/sudo.vim'
" Plugin xsunsmile/showmarks
Plugin 'terryma/vim-multiple-cursors'
"vim-misc is required for vim-session
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'

" Text objects
Plugin 'austintaylor/vim-indentobject'
" Plugin 'bootleq/vim-textobj-rubysymbol'
Plugin 'coderifous/textobj-word-column.vim'
" Plugin 'kana/vim-textobj-datetime'
" Plugin 'kana/vim-textobj-entire'
" Plugin 'kana/vim-textobj-function'
" Plugin 'kana/vim-textobj-user'
Plugin 'lucapette/vim-textobj-underscore'
Plugin 'nathanaelkane/vim-indent-guides'
" Plugin 'nelstrom/vim-textobj-rubyblock'
" Plugin 'thinca/vim-textobj-function-javascript'
Plugin 'vim-scripts/argtextobj.vim'

" Cosmetics, color scheme, Powerline...
Plugin 'chrisbra/color_highlight'
"Plugin 'skwp/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'vim-scripts/TagHighlight'
Plugin 'bogado/file-line'
Plugin 'flazz/vim-colorschemes'
Plugin 'AnsiEsc.vim'

" C/C++
" Plugin "Valloric/YouCompleteMe"

Plugin 'qualiabyte/vim-colorstepper'

call vundle#end()
filetype plugin indent on

" }}}

" General config --- {{{

" split positions
set splitbelow
set splitright

set autowrite
set autoread

" set relativenumber
" allow backspace in insert mode
set backspace=indent,eol,start
" store lots of :cmdline history
set history=1000
" undo lots of :cmdline history
set undolevels=1000
" show incomplete cmds down the bottom
set showcmd
" show current mode down the bottom
set showmode
" disable cursor blink
set gcr=a:blinkon0
" no sounds
set visualbell
" reload files changed outside vim
set autoread

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all
" the plugins.
let mapleader=","

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" increment++ octal, hex, alpha
set nf=octal,hex,alpha

" turn on syntax highlighting
syntax on

" syntax coloring lines that are too long just slows down the world
set synmaxcol=2048

" make command line two lines high
set ch=2

" don't update the display while executing macros
set lazyredraw

" hide the mouse pointer while typing
set mousehide

" global replaces during replacing
set gdefault

" same as default except that i remove the 'u' option
set complete=.,w,b,t

" when completing by tag, show the whole tag, not just the function name
set showfulltag

" get rid of the silly characters in separators
set fillchars = ""

" Allow the cursor to go in to "invalid" places
" set virtualedit=all

" add the unnamed register to the clipboard
set clipboard+=unnamed

" automatically read a file that has changed on disk
set autoread

set grepprg=grep\ -nH\ $*

" Highlight the current line and column
" Don't do this - It makes window redraws painfully slow
set nocursorline
set nocursorcolumn

" turn off swap files
set noswapfile
set nobackup
set nowb

" Persistent Undo

" Keep undo history across sessions, by storing in file.
" Only works all the time.

silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

" indentation
set autoindent
set smartindent
set smarttab
set shiftwidth=3
set softtabstop=3
set tabstop=3
set expandtab
set shiftround

set title

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

" display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

" wrap lines
set wrap
" wrap lines at convenient points
set linebreak

" completion ---

"enable ctrl-n and ctrl-p to scroll thru matches
set wildmenu

set wildmode=list:longest
"stuff to ignore when tab completing
set wildignore=*.o,*.obj,*~
set wildignore+=vim/backups*
set wildignore+=sass-cache*
set wildignore+=DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*/.png,*.jpg,*.gif
set wildignore+=*/.pyc

" Scrolling ---

" Start scrolling when we're 8 lines away from margins
set scrolloff=8
set sidescrolloff=15
set sidescroll=1

" Folds ---

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

"fold based on indent
" set foldmethod=indent
set foldmethod=marker
"deepest fold is 3 levels
set foldnestmax=3
"dont fold by default
" set nofoldenable
set foldlevelstart=0

" Search Settings ---

" find the next match as we type the search
set incsearch
" hilight searches by default
set hlsearch
" save up to 100 marks, enable capital marks
set viminfo='100,f1
" ignore case when searching...
set ignorecase
" ...unless we type a capital
set smartcase

" }}}

" Gui configs --- {{{

" vim ansiescaping plugging
if has('conceal')
  autocmd VimEnter * AnsiEsc
endif

if has("gui_running")

" Show tab number (useful for Cmd-1, Cmd-2.. mapping)
" For some reason this doesn't work as a regular set command,
" (the numbers don't show up) so I made it a VimEnter event
  autocmd GUIEnter * simalt ~n
  autocmd VimEnter * set guitablabel=%N:\ %t\ %M

" fullscreen options
  set guioptions+=c
  set guioptions+=R
  set guioptions-=m
  set guioptions-=r
  set guioptions-=b
  set guioptions-=T
  set guioptions-=R
  set guioptions-=L
  set guioptions-=l
  set guioptions-=e

  set guifont=Ubuntu\ Mono:h12,Inconsolata\ XL:h17,Inconsolata:h20,Monaco:h17

  " g file formats
  set fileencodings=cp1252
  set fileencoding=cp1252

  set fileformats=dos
  set fileformat=dos

else
" dont load csapprox if we no gui support - silences an annoying warning
  let g:CSApprox_loaded = 1
endif

" }}}

" Autogroups --- {{{

autocmd FocusLost * set number

" save file when losing focus
autocmd FocusLost * :silent! wall

" resize splits when the window is resized
au VimResized * :wincmd =

autocmd FocusGained * set relativenumber
autocmd InsertEnter * set number
autocmd InsertLeave * set relativenumber
"autocmd ColorScheme * highlight ExtraWhiteSpace ctermbg=red guibg=red
"au InsertLeave * match ExtraWhiteSpace /\s\+$/

" Reload vimrc when edited
autocmd! BufWritePost .vimrc source ~/.vimrc

" G files
augroup g_r

  autocmd!
  autocmd BufNewFile,BufRead *.ri set filetype=r
  autocmd BufNewFile,BufRead *.r set filetype=r
  autocmd BufNewFile,BufRead *.rh set filetype=r
  autocmd BufNewFile,BufRead *.cxx set filetype=cpp
  if exists('loaded_tcomment')
    call tcomment#DefineType('r', '# %s')
  endif
  autocmd FileType r set textwidth=100 colorcolumn=+1

augroup END

" }}}

" NERDTree --- {{{

" don't display these kinds of files
let NERDTreeIgnore=[ '\.ncb$', '\.suo$', '\.vcproj\.RIMNET', '\.obj$',
                   \ '\.ilk$', '^BuildLog.htm$', '\.pdb$', '\.idb$',
                   \ '\.embed\.manifest$', '\.embed\.manifest.res$',
                   \ '\.intermediate\.manifest$', '^mt.dep$',
                   \ '\.pyc$',
                   \ '\.avi$',  '\.mpeg$',
                   \ '\.jpeg$', '\.jpg$', '\.png$',
                   \ '\.dvi$',  '\.log$',  '\.ps$',  '\.aux$', '\.pdf$', '\.aux$', '\.toc$' ]

" quit nerdtree when selecting file
let NERDTreeQuitOnOpen = 1

" please don't open nerdtree at vim startup
let g:nerdtree_tabs_open_on_gui_startup = 0

" }}}

" Tagbar --- {{{

let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_autopreview = 1

" }}}

" Neocomplcache --- {{{

" a better autocomplete system!
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_smart_case = 1

" default # of completions is 100, that's crazy
let g:neocomplcache_max_list = 10

" words less than 3 letters long aren't worth completing
let g:neocomplcache_auto_completion_start_length = 3

" map standard ctrl-n completion to cmd-space
inoremap <D-Space> <C-n>

" this makes sure we use neocomplcache completefunc instead of
" the one in rails.vim, otherwise this plugin will crap out
let g:neocomplcache_force_overwrite_completefunc = 1

" define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

" prevent hanging with python: https://github.com/skwp/dotfiles/issues/163
let g:neocomplcache_omni_patterns['python'] = ''

" }}}

" Misc --- {{{

" enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

" }}}

" Vim Airline --- {{{

" always let airline status live
let laststatus = 2

let g:airline_theme = "badwolf"
let g:airline_section_x = ""
let g:airline_section_y = "%y"
set ruler
set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)

" }}}

" Vim Session --- {{{

let g:session_autosave_periodic = 10
let g:session_autosave = "yes"
let g:session_autoload = "yes"

map <Leader>v :tabnew ~/.vimrc<cr>

" }}}

" Colorscheme --- {{{

"tell the term has 256 colors
set t_Co=256

"let g:solarized_termcolors=256
set background=dark
let g:rehash256 = 1
" colorscheme molokai
" colorscheme badwolf
" colorscheme leo
" colorscheme jiks
" colorscheme Monokai-chris
" colorscheme ChocolateLiquor
" colorscheme campfire
" colorscheme gobo
" colorscheme coldgreen
colorscheme BlackSea

" }}}

" EasyMotion --- {{{

highlight EasyMotionTarget ctermbg=black ctermfg=red guibg=black guifg=red

" }}}

" Vim bookmarks --- {{{
highlight BookmarkSign ctermbg=NONE ctermfg=160
highlight BookmarkLine ctermbg=194 ctermfg=NONE
let g:bookmark_sign = '>>'
let g:bookmark_highlight_lines = 1
" }}}
"

" Custom mappings --- {{{

" Desactivate arrow keys
noremap  <Up>    <Esc>
noremap! <Up>    <Esc>
noremap  <Down>  <Esc>
noremap! <Down>  <Esc>
noremap  <Left>  <Esc>
noremap! <Left>  <Esc>
noremap  <Right> <Esc>
noremap! <Right> <Esc>

" <F?> key mappings
nnoremap <F1> :OpenSession<cr>
nnoremap <F2> :source ~/.vimrc<cr>
" close the nerd tree with shift-f7
nnoremap <F8> :NERDTreeTabsToggle<cr>
nnoremap <F9> :CtrlP<cr>

" use clinical leader key to move around windows
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l
nnoremap <Leader>o <C-w>o

" maximize the height of the current split
nnoremap <Leader>_ <C-w>_
" restore the size
nnoremap <Leader>= <C-w>=

" alright... let's try this out
imap jj <esc>
cmap jj <esc>

" quickquit
noremap <Leader>q :quit<cr>

" emptyline above and below
nnoremap gO O<ESC>j
nnoremap go o<ESC>j

" repeat command in visual mode
vnoremap . :normal .<cr>

" better indentation
vnoremap < <gv
vnoremap > >gv

" visual select whole file
map <Leader>a ggVG

" walk through the diffs
map <Leader>d /31m\\|32m<cr>

" visual replace selected text
map <Leader>r :%s::
map <Leader>rw :%s:<c-w><c-r>:

" delete trailing whitespace
map <Leader>x :%s/\s\+$//<cr>

" folding
nnoremap <Space> za
vnoremap <Space> za

" kill window
nnoremap K :qa!<cr>

" quicksave if saves
nnoremap s :wa<cr>

" reselect last-pasted text
nnoremap lp `[v`]

" keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz
nnoremap <c-o> <c-o>zz

" }}}

" Spelling mistakes --- {{{

" iabbr cyrpt    crypt
" iabbr Pdb      import pdb; pdb.set_trace()
" iabbr reponse  response
" iabbr None  return None

" }}}

