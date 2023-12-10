local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Tab management.
keymap.set('n', 'tn', ':tabnew<CR>', opts)
keymap.set('n', 'tk', ':tabnext<CR>', opts)
keymap.set('n', 'tj', ':tabprev<CR>', opts)

-- Pane navigation.
keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
keymap.set('n', '<C-k>', ':wincmd k<CR>', opts)
keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)

-- Indenting in visual mode.
keymap.set('v', '<', '<gv')
keymap.set('v', '>', '>gv')

-- Clear highlighted search
keymap.set('n', '<leader>k', ':nohlsearch<CR>', {desc='Clear search'})

-- Delete without overwriting the copy-paste register.
keymap.set({'n', 'v'}, 'c', '"_c', {desc='which_key_ignore'})
keymap.set({'n', 'v'}, 'C', '"_C', {desc='which_key_ignore'})
keymap.set({'n', 'v'}, 'x', '"_x', {desc='which_key_ignore'})
keymap.set({'n', 'v'}, 'X', '"_X', {desc='which_key_ignore'})
