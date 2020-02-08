" Plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

call plug#begin()
    Plug 'preservim/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive' " Needed for Airline to show current Git branch
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
call plug#end()

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" General settings
    set nocompatible
    colorscheme gruvbox

    " Airline theme
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#enabled = 1

    set bg=dark
    syntax on

    filetype plugin indent on
    set backspace=indent,eol,start

    set tabstop=4
    set shiftwidth=4
    set expandtab
    set number relativenumber

    set encoding=utf-8
    set fileencoding=utf-8
    set ffs=unix,dos,mac

    set nobackup
    set nowb
    set noswapfile

    set hlsearch
    set incsearch
    set ignorecase
    set smartcase
    nnoremap <C-l> :nohl<CR><C-l>:echo "Search Cleared"<CR>

    " Toggle line numbers and Git gutter
        nnoremap <silent> <C-n> :set number! <BAR> :GitGutterSignsToggle <BAR> :set relativenumber!<CR>

    " Toggle NERDTree
        nnoremap <C-b> :NERDTreeToggle<CR>

    " Highlight column 81
        set colorcolumn=81

    " Show trailing whitespaces
        let c_space_errors = 1
        let c_no_tab_space_error = 1

    " Highlight tabs as errors
        match Error /\t/

    " Fuzzy finding
        set wildmenu
        set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
        set wildignore+=*.pdf,*.psd

    " Share clipboard with the system
        set clipboard=unnamedplus

    " Enable code folding
        set foldmethod=syntax
        set nofoldenable

    " Configure print options
        set printoptions=paper:A4,duplex:off,syntax:y,formfeed:y

" Save undo info between sessions
    if !isdirectory($HOME."/.vim")
        call mkdir($HOME."/.vim", "", 0770)
    endif
    if !isdirectory($HOME."/.vim/undo-dir")
        call mkdir($HOME."/.vim/undo-dir", "", 0700)
    endif
    set undodir=~/.vim/undo-dir
    set undofile

" Tabs and tab movement
    nnoremap tn :tabnew<Space>
    nnoremap <silent> tk :tabnext<CR>
    nnoremap <silent> tj :tabprev<CR>
    nnoremap <silent> th :tabfirst<CR>
    nnoremap <silent> tl :tablast<CR>

" Split and window movement
    nmap ss :split<CR><C-w>w
    nmap sv :vsplit<CR><C-w>w
    map sh <C-w>h
    map sk <C-w>k
    map sj <C-w>j
    map sl <C-w>l

" Insert blank lines
    nnoremap J o<esc>k
    nnoremap K O<esc>j

