local opt = vim.opt

vim.g.mapleader = ' '               -- Set <space> as the leader key.
vim.g.maplocalleader = ' '
opt.number = true                   -- Show line numbers.
opt.wrap = false                    -- Don't wrap long lines.
opt.scrolloff = 8                   -- Start scrolling when 8 lines from top or bottom.
opt.sidescrolloff = 8               -- Start scrolling when 8 columns from the sides.
opt.mousescroll = 'hor:0'           -- Disable horizontal mouse scrolling.
opt.inccommand = 'split'            -- Preview substitutions live.
opt.autocomplete = true             -- Enable built-in insert-mode auto-completion
opt.completeopt = { 'menu', 'menuone', 'noinsert' }

-- Show trailing whitespaces
opt.list = true
opt.listchars:append("trail:·")

-- Indentation
opt.tabstop = 4                     -- Number of spaces to represent a <Tab> with.
opt.shiftwidth = 4                  -- Number of spaces inserted for indentation.
opt.softtabstop = 4                 -- Number of spaces that a press on <Tab> inserts.
opt.expandtab = true                -- Insert spaces whenever the <Tab> key is pressed.
opt.smartindent = true              -- Do smart autoindenting when starting a new line.
opt.autoindent = true               -- Copy indentation from current line.

-- Search settings
opt.ignorecase = true               -- Ignore case in search patterns.
opt.smartcase = true                -- Case sensitive search when capital letters are used.
opt.incsearch = true                -- Show matches as you type

-- Visual settings
opt.cursorline = true               -- Enable line marker.
opt.colorcolumn = '81'              -- Highlight column 81.
opt.termguicolors = true            -- Enable 24-bit colors.
opt.winborder = 'rounded'           -- Enable rounder borders in floating windows
opt.showmatch = true                -- Highlight matching brackets.
opt.matchtime = 2                   -- How long to show matching bracket.

-- File handling
opt.swapfile = false                -- Don't create swap files.
opt.undofile = true                 -- Persistent undo.
opt.updatetime = 300                -- Faster autocompletion
opt.clipboard:append('unnamedplus') -- Use the system clipboard for copy-paste operations.

-- Split behavior
opt.splitright = true               -- Open vertical split to the right.
opt.splitbelow = true               -- Open horizontal split below.
