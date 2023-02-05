local options = {
  mouse = 'a',               -- Enable mouse support
  cursorline = true,         -- Enable line marker
  colorcolumn = '81',        -- Highlight column 81
  tabstop = 4,               -- Number of spaces in a <Tab>
  shiftwidth = 4,
  softtabstop = 4,
  expandtab = true,
  autoread = true,           -- Automatically read file again if modified outside of nvim
  number = true,             -- Add line numbers 
  relativenumber = true,     -- Add relative line numbers
  wrap = false,              -- Do not wrap long lines
  foldlevelstart = 99,       -- Unfold all folds when opening a file
  scrolloff = 8,             -- Start scrolling when 8 lines from top or bottom
  sidescrolloff = 8,         -- Start scrolling when 8 columns from the sides
  smartcase = true,          -- Case insensitive search unless capital letters are used
  ignorecase = true,
  splitright = true,         -- Open splits intuitively
  splitbelow = true,
  backup = false,            -- Do not make any automatic backups
  writebackup = false,
  swapfile = false,          -- Do not use a swapfile for the buffer
  clipboard = 'unnamedplus', -- Use the system clipboard for operations
  undofile = true,           -- Save undo history
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
