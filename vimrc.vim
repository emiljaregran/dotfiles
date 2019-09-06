" General Vim settings
    set nocompatible
    colorscheme gruvbox

    " Vim Airline theme
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
    set ignorecase
    set smartcase
    nnoremap <C-l> :nohl<CR><C-l>:echo "Search Cleared"<CR>

    " Toggle line numbers
    nnoremap <C-n> :set number! <BAR> :set relativenumber!<CR>

    " Highlight column 81
        set colorcolumn=81

    " Show trailing whitespaces
        let c_space_errors = 1
        let c_no_tab_space_error = 1

    " Highlight tabs as errors
        match Error /\t/

    " Share clipboard with the system
        set clipboard=unnamedplus

    " Enable code folding
        set foldmethod=syntax
        set nofoldenable

    " Configure print options
        set printoptions=paper:A4,duplex:off,syntax:y,formfeed:y

" Tab and Movement Management
    nnoremap tn :tabnew<Space>
    nnoremap tk :tabnext<CR>
    nnoremap tj :tabprev<CR>
    nnoremap th :tabfirst<CR>
    nnoremap tl :tablast<CR>

