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

" Html, Xml, Css, Markdown...
Plugin 'claco/jasmine.vim'
Plugin 'digitaltoad/vim-jade'
Plugin 'groenewege/vim-less'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'kchmck/vim-coffee-script'
Plugin 'nelstrom/vim-markdown-preview'
Plugin 'skwp/vim-html-escape'
Plugin 'slim-template/vim-slim'
Plugin 'timcharper/textile.vim'
Plugin 'tpope/vim-haml'
Plugin 'wavded/vim-stylus'

" General text editing improvements...
Plugin 'andrewRadev/splitjoin.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'shougo/neocomplcache'
Plugin 'briandoll/change-inside-surroundings.vim'
Plugin 'godlygeek/tabular'

" snippets
if has("python")
   Plugin 'sirver/ultisnips'
   Plugin 'sjl/gundo.vim'
endif

Plugin 'nelstrom/vim-visual-star-search'
Plugin 'skwp/vim-easymotion'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'tomtom/tcomment_vim'
Plugin 'vim-scripts/IndexedSearch'
Plugin 'vim-scripts/camelcasemotion'
Plugin 'vim-scripts/matchit.zip'

" General vim improvements
Plugin 'marcWeber/vim-addon-mw-utils'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'skwp/YankRing.vim'
Plugin 'skwp/greplace.vim'
Plugin 'skwp/vim-conque'
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-ragtag'
" Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
" Plugin 'tpope/vim-unimpaired'
Plugin 'vim-scripts/lastpos.vim'
Plugin 'terryma/vim-multiple-cursors'
" vim-misc is required for vim-session
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'

" Text objects
Plugin 'austintaylor/vim-indentobject'
Plugin 'coderifous/textobj-word-column.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'vim-scripts/argtextobj.vim'

" Cosmetics, color scheme, Powerline...
Plugin 'chrisbra/color_highlight'
Plugin 'vim-scripts/TagHighlight'
Plugin 'bogado/file-line'
Plugin 'flazz/vim-colorschemes'

" C/C++
" Plugin "valloric/youcompleteme"
Plugin 'ansiesc.vim'

call vundle#end()
filetype plugin indent on

" }}}

" General config --- {{{

" split positions
set splitbelow
set splitright

set autowrite
" reload files changed outside vim
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
set cmdheight=2

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
" unless we type a capital
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
autocmd VimResized * :wincmd =

autocmd FocusGained * set relativenumber
autocmd InsertEnter * set number
autocmd InsertLeave * set relativenumber
"autocmd ColorScheme * highlight ExtraWhiteSpace ctermbg=red guibg=red
"autocmd InsertLeave * match ExtraWhiteSpace /\s\+$/

" reload vimrc when edited
autocmd! BufWritePost .vimrc source ~/.vimrc

" G files
augroup g_r

  autocmd!
  autocmd BufNewFile,BufRead *.cxx set filetype=cpp
  autocmd BufNewFile,BufRead *.hxx set filetype=h
  autocmd BufNewFile,BufRead *.r set filetype=gr
  autocmd BufNewFile,BufRead *.rh set filetype=gr
  autocmd BufNewFile,BufRead *.ri set filetype=gr
  autocmd BufNewFile,BufRead *.id set filetype=gr
  autocmd BufNewFile,BufRead *.ix set filetype=gr
  " if exists("loaded_tcomment")
    call tcomment#DefineType('gr', '# %s')
  " endif
  autocmd FileType gr set textwidth=100 colorcolumn=+1
  autocmd FileType gr :UltiSnipsAddFiletypes gr.cpp

augroup END

" }}}

" NERDTree --- {{{

" don't display these kinds of files
let NERDTreeIgnore = [ '\.ncb$', '\.suo$', '\.vcproj\.RIMNET', '\.obj$',
                     \ '\.ilk$', '^BuildLog.htm$', '\.pdb$', '\.idb$',
                     \ '\.embed\.manifest$', '\.embed\.manifest.res$',
                     \ '\.intermediate\.manifest$', '^mt.dep$',
                     \ '\.pyc$',
                     \ '\.rtf$', '\.mod$', '\.dif$', '\.dff$', '\.docgen$', '\.rvc',
                     \ '\.avi$',  '\.mpeg$',
                     \ '\.jpeg$', '\.jpg$', '\.png$',
                     \ '\.o$',
                     \ '\.dvi$',  '\.log$',  '\.ps$',  '\.aux$', '\.pdf$', '\.aux$', '\.toc$' ]

" quit nerdtree when selecting file
let NERDTreeQuitOnOpen = 1

" please don't open nerdtree at vim startup
let g:nerdtree_tabs_open_on_gui_startup = 0

" }}}

" SuperTab --- {{{

" Navigate the completion menu from top to bottom
" let g:SuperTabDefaultCompletionType = "<c-n>"

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
let g:neocomplcache_max_list = 15

" words less than 3 letters long aren't worth completing
let g:neocomplcache_auto_completion_start_length = 3

" map standard ctrl-n completion to cmd-space
" inoremap <D-Space> <C-n>

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

" Timer --- {{{

function! s:getminute(currentsessiontime)
  let l:hour = strftime("%H",a:currentsessiontime) * 60
  let l:minute = strftime("%M",a:currentsessiontime)
  return l:hour + l:minute
endfunction

function! TimeKeeper()
   let l:currentsessiontime = localtime()
   if !exists('g:beginsessiontime')
      let g:beginsessiontime = l:currentsessiontime
   endif

   let l:timeduration = s:getminute(l:currentsessiontime) - s:getminute(g:beginsessiontime)
   let g:beginsessiontime = ( l:timeduration/60 ).'h'.(l:timeduration % 60)
endfunction

if !exists('g:beginsessiontime')
   call TimeKeeper()
endif

autocmd FocusLost * call TimeKeeper()

" }}}

" Vim Airline --- {{{
"
" always let airline status live
let laststatus = 2
set ruler
set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)

let g:airline_theme = "luna"
let g:airline_section_b = '%{strftime("%b %d %H:%M")}'
let g:airline_section_x = '%{g:beginsessiontime}'
let g:airline_section_y = "%y"

" }}}

" Vim Session --- {{{

let g:session_autosave_periodic = 10
let g:session_autosave = "yes"
let g:session_autoload = "yes"
" don't lock sessions
let g:session_lock_enabled = 0

" }}}

" UltiSnip --- {{{

let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<c-b>"
let g:UltiSnipsJumpBackwardTrigger = "<c-z>"
let g:UltiSnipsEditSplit = "vertical"

" }}}

" Gundo --- {{{

let g:gundo_playback_delay = 3600
if !has("python")
  let g:gundo_enable = 1
endif

" }}}

" Colorscheme --- {{{

"tell vim terminal supports 256 colors
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
" colorscheme BlackSea
" colorscheme solarized
colorscheme Chasing_Logic

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
nnoremap <F3> :GundoToggle<cr>
" close the nerd tree with shift-f7
nnoremap <F8> :NERDTreeTabsToggle<cr>
nnoremap <F9> :CtrlP<cr>
nnoremap <F12> :call TimeKeeper()<cr>

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
" map <Leader>a ggVG

" walk through the diffs
map <Leader>d /;3<cr>

" visual replace selected text
map <Leader>r :%s::
map <Leader>rw :%s:<c-w><c-r>:

map <Leader>v :tabnew ~/.vimrc<cr>

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
" nnoremap lp `[v`]

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

