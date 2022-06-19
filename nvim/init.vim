"
"   https://github.com/junegunn/vim-plug    (Vim plugin manager)
"   https://github.com/ronniedroid/getnf    (JetBrainsMono fonts)
"   https://github.com/MaskRay/ccls         (C/C++ language server)
"   https://github.com/microsoft/pyright    (Python language server)
"
"   Run :PlugInstall to install all specified plugins the first time.
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmode=longest:full,full

" Don't wrap long lines
set nowrap

" Keep the window title up-to-date
set title

" Number of spaces in a <Tab>
set tabstop=4
set softtabstop=4
set expandtab

" Enable autoindents
set smartindent

" Number of spaces used for autoindents
set shiftwidth=4

" Adds line numbers
set number

" Case insensitive search unless capital letters are used
set smartcase
set ignorecase

" Open splits intuitively
set splitright
set splitbelow

" Start scrolling when 8 lines from top, bottom or the sides
set scrolloff=8
set sidescrolloff=8

" Save undo history
set undofile

" Enable mouse support
set mouse=a

" Show invisible characters
set list listchars=tab:▸\ ,trail:•,nbsp:•,precedes:←,extends:→

" Update git gutter symbols every 100 ms
set updatetime=100

" Unfold all folds when opening a file
set foldlevelstart=99
set foldmethod=syntax

" Use the system clipboard (requires xclip to be installed)
set clipboard+=unnamedplus

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/site/plugged')

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'rhysd/vim-grammarous'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim' " Dependency to Telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'joshdick/onedark.vim'
Plug 'ryanoasis/vim-devicons'

" Auto completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

call plug#end()


lua << EOF
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'ge', vim.diagnostic.goto_next, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, bufopts)
end

-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
    },
    {
      { name = 'buffer' },
    })
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require('lspconfig')['ccls'].setup {
    on_attach = on_attach,
    capabilities = capabilities
}

require('lspconfig')['pyright'].setup {
    on_attach = on_attach,
    capabilities = capabilities
}
EOF


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
set termguicolors
set colorcolumn=81
colorscheme onedark
let g:airline_powerline_fonts = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keymaps
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = " "
let maplocalleader = " "

nnoremap <silent> <leader>k :nohlsearch<CR><C-l>:echo "Search cleared"<CR>

" Reselect visual selection after indenting
vnoremap > >gv
vnoremap < <gv

" Maintain the cursor position when yanking a visual selection
vnoremap <expr>y "my\"" . v:register . "y`y"

" Open current file in its default program
nnoremap <leader>x :!xdg-open %<CR><CR>

" Remap code completion to Ctrl+Space
inoremap <Nul> <C-x><C-o>
inoremap <C-Space> <C-x><C-o>

" Tabs and tab movement
nnoremap tn :tabnew<Space>
nnoremap <silent> tk :tabnext<CR>
nnoremap <silent> tj :tabprev<CR>

" Resize splits with the arrow keys
nnoremap <silent> <C-Up> :resize +2<CR>
nnoremap <silent> <C-Down> :resize -2<CR>
nnoremap <silent> <C-Left> :vertical resize -2<CR>
nnoremap <silent> <C-Right> :vertical resize +2<CR>

" CTRL + hjkl for navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Move text up and down
nnoremap <silent> <A-j> :move .+1<CR>==
nnoremap <silent> <A-k> :move .-2<CR>==
inoremap <silent> <A-j> <Esc>:move .+1<CR>==gi
inoremap <silent> <A-k> <Esc>:move .-2<CR>==gi
vnoremap <silent> <A-j> :move '>+1<CR>gv=gv
vnoremap <silent> <A-k> :move '<-2<CR>gv=gv

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <leader>n :NERDTreeToggle<CR>
nnoremap <silent> <leader>N :NERDTreeFind<CR>

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fugitive.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <leader>gb :Git blame<CR>
nnoremap <silent> <leader>gl :Git log<CR>
nnoremap <silent> <leader>gd :Gvdiffsplit<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Telescope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> ff :Telescope find_files<CR>
nnoremap <silent> fg :Telescope git_files<CR>
nnoremap <silent> fd :Telescope git_commits<CR>
nnoremap <silent> fc :Telescope git_bcommits<CR>
nnoremap <silent> gr :Telescope lsp_references<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Grammar checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <leader>cg :GrammarousCheck --comments-only<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <silent> <leader>ss :setlocal spell!<CR>

map <silent> <leader>sn ]s
map <silent> <leader>sp [s
map <silent> <leader>sa zg
map <silent> <leader>s? z=

