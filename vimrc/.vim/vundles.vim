" ========================================
" Vim plugin configuration
" ========================================
"
" This file contains the list of plugin installed using vundle plugin manager.
" Once you've updated the list of plugin, you can run vundle update by issuing
" the command :BundleInstall from within vim or directly invoking it from the
" command line with the following syntax:
" vim --noplugin -u vim/vundles.vim -N "+set hidden" "+syntax on" +BundleClean! +BundleInstall +qall
" Filetype off is required by vundle

" let Vundle manage Vundle (required)
Plugin 'gmarik/vundle'

" All your bundles here

" Ruby, Rails, Rake...
Plugin 'astashov/vim-ruby-debugger'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'skwp/vim-ruby-conque'
Plugin 'tpope/vim-rails.git'
Plugin 'tpope/vim-rake.git'
Plugin 'tpope/vim-rvm.git'
Plugin 'vim-ruby/vim-ruby.git'
Plugin 'vim-scripts/Specky.git'
Plugin 'ck3g/vim-change-hash-syntax'

" Other languages
" Plugin "briancollins/vim-jst"
" Plugin "pangloss/vim-javascript"

" Html, Xml, Css, Markdown...
Plugin 'claco/jasmine.vim'
Plugin 'digitaltoad/vim-jade.git'
Plugin 'groenewege/vim-less.git'
Plugin 'itspriddle/vim-jquery.git'
Plugin 'jtratner/vim-flavored-markdown.git'
Plugin 'kchmck/vim-coffee-script'
Plugin 'nelstrom/vim-markdown-preview'
Plugin 'skwp/vim-html-escape'
Plugin 'slim-template/vim-slim.git'
Plugin 'timcharper/textile.vim.git'
Plugin 'tpope/vim-haml'
Plugin 'wavded/vim-stylus'

" Git related...
" Plugin 'gregsexton/gitv'
" Plugin 'mattn/gist-vim'
" Plugin 'skwp/vim-git-grep-rails-partial'
" Plugin 'tjennings/git-grep-vim'
" Plugin 'tpope/vim-fugitive'
" Plugin 'tpope/vim-git'
" Plugin 'sjl/threesome.vim.git'
" Plugin 'phleet/vim-mercenary'

" General text editing improvements...
Plugin 'AndrewRadev/splitjoin.vim'
"Plugin 'Raimondi/delimitMate'
Plugin 'Shougo/neocomplcache.git'
Plugin 'briandoll/change-inside-surroundings.vim.git'
Plugin 'garbas/vim-snipmate.git'
Plugin 'godlygeek/tabular'
" Plugin 'sirver/ultisnips.git'
Plugin 'honza/vim-snippets'
Plugin 'nelstrom/vim-visual-star-search'
Plugin 'skwp/vim-easymotion'
Plugin 'MattesGroeger/vim-bookmarks.git'
Plugin 'tomtom/tcomment_vim.git'
"Plugin 'tpope/vim-bundler'
Plugin 'vim-scripts/IndexedSearch'
Plugin 'vim-scripts/camelcasemotion.git'
Plugin 'vim-scripts/matchit.zip.git'

" General vim improvements
Plugin 'MarcWeber/vim-addon-mw-utils.git'
"Plugin 'bogado/file-line.git'
Plugin 'jistr/vim-nerdtree-tabs.git'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar.git'
Plugin 'mattn/webapi-vim.git'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree.git'
Plugin 'scrooloose/syntastic.git'
Plugin 'sjl/gundo.vim'
Plugin 'skwp/YankRing.vim'
Plugin 'skwp/greplace.vim'
Plugin 'skwp/vim-conque'
Plugin 'tomtom/tlib_vim.git'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-endwise.git'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-repeat.git'
Plugin 'tpope/vim-surround.git'
Plugin 'tpope/vim-unimpaired'
" Don't add the below git repo makes gvim not boot
"Plugin 'vim-scripts/AutoTag.git'
Plugin 'vim-scripts/lastpos.vim'
Plugin 'vim-scripts/sudo.vim'
" Plugin xsunsmile/showmarks.git
Plugin 'terryma/vim-multiple-cursors'
"vim-misc is required for vim-session
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'

" Text objects
Plugin 'austintaylor/vim-indentobject'
Plugin 'bootleq/vim-textobj-rubysymbol'
Plugin 'coderifous/textobj-word-column.vim'
Plugin 'kana/vim-textobj-datetime'
Plugin 'kana/vim-textobj-entire'
Plugin 'kana/vim-textobj-function'
Plugin 'kana/vim-textobj-user'
Plugin 'lucapette/vim-textobj-underscore'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'thinca/vim-textobj-function-javascript'
Plugin 'vim-scripts/argtextobj.vim'

" Puppet
Plugin 'puppetlabs/puppet-syntax-vim.git'

" Cosmetics, color scheme, Powerline...
Plugin 'chrisbra/color_highlight.git'
"Plugin 'skwp/vim-colors-solarized'
Plugin 'bling/vim-airline.git'
Plugin 'vim-scripts/TagHighlight.git'
Plugin 'bogado/file-line.git'
Plugin 'flazz/vim-colorschemes.git'
Plugin 'AnsiEsc.vim'

" C/C++
" Plugin "Valloric/YouCompleteMe"

" Customization
" The plugins listed in ~/.vim/.vundles.local will be added here to
" allow the user to add vim plugins to yadr without the need for a fork.
if filereadable(expand("~/.yadr/vim/.vundles.local"))
  source ~/.yadr/vim/.vundles.local
endif

