" General Vim settings
    set nocompatible
"    colorscheme gruvbox
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
    nnoremap <C-l> :nohl<CR><C-l>:echo "Search Cleared"<CR>

    " Toggle line numbers
    nnoremap <C-n> :set number! <BAR> :set relativenumber!<CR>

    " Highlight column 81
        highlight ColorColumn ctermbg=magenta
        call matchadd('colorColumn', '\%81v', 100)

    " Show trailing whitespaces
        highlight ExtraWhitespace ctermbg=red guibg=red
        match ExtraWhitespace /\s\+$/

    " Share clipboard with the system
        set clipboard=unnamedplus
" Tab and Movement Management
    nnoremap tn :tabnew<Space>
    nnoremap tk :tabnext<CR>
    nnoremap tj :tabprev<CR>
    nnoremap th :tabfirst<CR>
    nnoremap tl :tablast<CR>

    nnoremap H 0
    nnoremap L $
    nnoremap J G
    nnoremap K gg
