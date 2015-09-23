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

if has("gui_running")
   set rtp+=c:\users\okecrich\.vim\bundle\Vundle.vim
else
   set rtp+=~/.vim/bundle/vundle
endif

call vundle#begin()

" This loads all the plugins specified in ~/.vim/vundle.vim
" Use Vundle plugin to manage all other plugins
if filereadable(expand("~/.vim/vundles.vim"))
  source ~/.vim/vundles.vim
endif

call vundle#end()

filetype plugin indent on

" }}}

" General config --- {{{

" set number                    "Line numbers are good
"Set relative number
set relativenumber
"Allow backspace in insert mode
set backspace=indent,eol,start
"Store lots of :cmdline history
set history=1000
"Undo lots of :cmdline history
set undolevels=1000
"Show incomplete cmds down the bottom
set showcmd
"Show current mode down the bottom
set showmode
"Disable cursor blink
set gcr=a:blinkon0
"No sounds
set visualbell
"Reload files changed outside vim
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

"increment++ octal, hex, alpha
set nf=octal,hex,alpha

"turn on syntax highlighting
syntax on

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=2048

" Make command line two lines high
set ch=2

" Don't update the display while executing macros
set lazyredraw

" Hide the mouse pointer while typing
set mousehide

" Same as default except that I remove the 'u' option
set complete=.,w,b,t

" When completing by tag, show the whole tag, not just the function name
set showfulltag

" get rid of the silly characters in separators
set fillchars = ""

" Allow the cursor to go in to "invalid" places
" set virtualedit=all

" Add the unnamed register to the clipboard
set clipboard+=unnamed

" Automatically read a file that has changed on disk
set autoread

set grepprg=grep\ -nH\ $*

" Highlight the current line and column
" Don't do this - It makes window redraws painfully slow
set nocursorline
set nocursorcolumn

" Turn Off Swap Files

set noswapfile
set nobackup
set nowb

" Persistent Undo

" Keep undo history across sessions, by storing in file.
" Only works all the time.

silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

" Indentation

set autoindent
set smartindent
set smarttab
set shiftwidth=3
set softtabstop=3
set tabstop=3
set expandtab

" Display tabs and trailing spaces visually

set list listchars=tab:\ \ ,trail:·

set wrap       " wrap lines
set linebreak  " wrap lines at convenient points

" Completion ---

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

" Scrolling

"Start scrolling when we're 8 lines away from margins
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

" Find the next match as we type the search
set incsearch
" Hilight searches by default
set hlsearch
" Save up to 100 marks, enable capital marks
set viminfo='100,f1
" Ignore case when searching...
set ignorecase
" ...unless we type a capital
set smartcase

" Desactivate arrow keys

noremap  <Up>    <Esc>
noremap! <Up>    <Esc>
noremap  <Down>  <Esc>
noremap! <Down>  <Esc>
noremap  <Left>  <Esc>
noremap! <Left>  <Esc>
noremap  <Right> <Esc>
noremap! <Right> <Esc>

" Underline the current line with '='

nnoremap <silent> <Leader>u= :t.\|s/./=/g\|:nohls<cr>
nnoremap <silent> <Leader>u- :t.\|s/./-/g\|:nohls<cr>
nnoremap <silent> <Leader>u~ :t.\|s/./\\~/g\|:nohls<cr>

" Alright... let's try this out

imap jj <esc>
cmap jj <esc>

" QuickSave

noremap <Leader>w :wa<cr>
vnoremap <Leader>w <C-C>:wa<cr>
inoremap <Leader>w <C-O>:wa<cr>

" QuickQuit

noremap <Leader>q :quit<cr>

" EmptyLine above and below

nnoremap  gO O<ESC>j
nnoremap  go o<ESC>j

" Repeat command in visual mode

vnoremap . :normal .<cr>

"  Better indentation

vnoremap < <gv
vnoremap > >gv

" Select file
map <Leader>a ggVG

" Show trailing whitespace

map <Leader>x :%s/\s\+$//<cr>

" Folding ---
nnoremap <Space> za
vnoremap <Space> za

" Kill window
nnoremap K :qa<cr>

" Save
nnoremap s :w<cr>

" Reselect last-pasted text
nnoremap gp `[v`]

" }}}

" Gui configs --- {{{

if has('conceal')

  autocmd VimEnter * AnsiEsc

endif

if has("gui_running")

" Show tab number (useful for Cmd-1, Cmd-2.. mapping)
" For some reason this doesn't work as a regular set command,
" (the numbers don't show up) so I made it a VimEnter event
  autocmd VimEnter * set guitablabel=%N:\ %t\ %M

"   Fullscreen options
"
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

  "set guifont=Inconsolata\ XL:h17,Inconsolata:h20,Monaco:h17
  set guifont=Ubuntu\ Mono:h12

  " g file formats
  set fileencodings=cp1252
  set fileencoding=cp1252

  set fileformats=dos
  set fileformat=dos

else
"dont load csapprox if we no gui support - silences an annoying warning
  let g:CSApprox_loaded = 1
endif

" }}}

" Autogroups --- {{{

autocmd FocusLost   * set number

" Save file when losing focus
autocmd FocusLost   * :silent! wall

" Resize splits when the window is resized
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
  autocmd FileType r set textwidth=100 colorcolumn=101

augroup END

" }}}

" NERDTree --- {{{

" Close the NERD Tree with Shift-F7
nnoremap <F7> :NERDTreeTabsToggle<cr>

" Don't display these kinds of files
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

" please don't open nerdtree after vim startup even if gui
let g:nerdtree_tabs_open_on_gui_startup = 0

" }}}

" Tagbar --- {{{

let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_autopreview = 1

" }}}

" Neocomplcache --- {{{

" A beter autocomplete system!
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_smart_case = 1

" default # of completions is 100, that's crazy
let g:neocomplcache_max_list = 10

" words less than 3 letters long aren't worth completing
let g:neocomplcache_auto_completion_start_length = 3

" Map standard Ctrl-N completion to Cmd-Space
inoremap <D-Space> <C-n>

" This makes sure we use neocomplcache completefunc instead of
" the one in rails.vim, otherwise this plugin will crap out
let g:neocomplcache_force_overwrite_completefunc = 1

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

" Prevent hanging with python: https://github.com/skwp/dotfiles/issues/163
let g:neocomplcache_omni_patterns['python'] = ''

" }}}

" Misc --- {{{

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

nnoremap <F1> :OpenSession<cr>
nnoremap <F2> :source ~/.vimrc<cr>

nnoremap <F9> :CtrlP<cr>

" }}}

" Vim Airline --- {{{

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
colorscheme coldgreen

" }}}

" EasyMotion --- {{{

highlight EasyMotionTarget ctermbg=none ctermfg=red

" }}}

" Change the color scheme from a list of color scheme names.
" Version 2010-09-12 from http://vim.wikia.com/wiki/VimTip341
" Press key:
"   F8                next scheme
"   Shift-F8          previous scheme
"   Alt-F8            random scheme
" Set the list of color schemes used by the above (default is 'all'):
"   :SetColors all              (all $VIMRUNTIME/colors/*.vim)
"   :SetColors my               (names built into script)
"   :SetColors blue slate ron   (these schemes)
"   :SetColors                  (display current scheme names)
" Set the current color scheme based on time of day:
"   :SetColors now
" if v:version < 700 || exists('loaded_setcolors') || &cp
"   finish
" endif

" Spelling mistakes --- {{{

" iabbr cyrpt    crypt
" iabbr Pdb      import pdb; pdb.set_trace()
" iabbr reponse  response
" iabbr None  return None

" }}}


