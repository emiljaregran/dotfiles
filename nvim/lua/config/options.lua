local opt = vim.opt

-- Tabs & indentation
opt.tabstop = 4                     -- Number of spaces to represent a <Tab> with.
opt.shiftwidth = 4                  -- Number of spaces inserted for indentation.
opt.softtabstop = 4                 -- Number of spaces that a press on <Tab> inserts.
opt.expandtab = true                -- Insert spaces whenever the <Tab> key is pressed.
opt.smartindent = true              -- Do smart autoindenting when starting a new line.

-- Line wrapping
opt.wrap = false                    -- Don't wrap long lines.

-- Search settings
opt.ignorecase = true               -- Ignore case in search patterns.
opt.smartcase = true                -- Case sensitive search when capital letters are used.

-- Split windows
opt.splitright = true               -- Open vertical split to the right.
opt.splitbelow = true               -- Open horizontal split below.

-- Appearance
opt.number = true                   -- Show line numbers.
opt.cursorline = true               -- Enable line marker.
opt.colorcolumn = '81'              -- Highlight column 81.
opt.termguicolors = true            -- Enable 24-bit RGB colors in the TUI.
opt.scrolloff = 8                   -- Start scrolling when 8 lines from top or bottom.
opt.sidescrolloff = 8               -- Start scrolling when 8 columns from the sides.
opt.conceallevel = 2                -- Hide bold, italic etc. specifiers in Neorg.
opt.completeopt = 'menuone,noinsert,noselect'

-- Behaviour
opt.swapfile = false                -- Don't use a swapfile for the buffer.
opt.undofile = true                 -- Save undo history.
opt.timeoutlen = 500                -- Show WhichKey after 500 ms.
opt.iskeyword:append('-')           -- Treat words containing - as a whole word.
opt.clipboard:append('unnamedplus') -- Use the system clipboard for copy-paste operations.
