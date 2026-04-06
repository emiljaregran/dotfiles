local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Tab management.
map('n', 'tn', ':tabnew<CR>', opts)
map('n', 'tk', ':tabnext<CR>', opts)
map('n', 'tj', ':tabprev<CR>', opts)

-- Pane navigation.
map('n', '<C-h>', ':wincmd h<CR>', opts)
map('n', '<C-j>', ':wincmd j<CR>', opts)
map('n', '<C-k>', ':wincmd k<CR>', opts)
map('n', '<C-l>', ':wincmd l<CR>', opts)

-- Indenting in visual mode.
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Goto line end/beginning.
map('n', 'gl', '$')
map('n', 'gh', '^')

-- Clear highlighted search.
map('n', '<leader>k', '<cmd>nohlsearch<CR>', opts)

-- Undo tree
local function open_undotree()
  vim.cmd('packadd nvim.undotree')
  require('undotree').open()
end
map('n', '<leader>u', open_undotree)
