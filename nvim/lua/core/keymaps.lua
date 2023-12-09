Keymap = function(mode, lhs, rhs, opts)
    opts = opts or {}
    opts.noremap = true
    opts.silent = true

    vim.keymap.set(mode, lhs, rhs, opts)
end

Nmap = function(lhs, rhs, opts)
    Keymap('n', lhs, rhs, opts)
end

-- Tabs and tab movement
Nmap('tn', '<cmd>tabnew<CR>')
Nmap('tk', '<cmd>tabnext<CR>')
Nmap('tj', '<cmd>tabprev<CR>')

-- Navigate between panes
Nmap('<C-h>', '<cmd>wincmd h<CR>')
Nmap('<C-j>', '<cmd>wincmd j<CR>')
Nmap('<C-k>', '<cmd>wincmd k<CR>')
Nmap('<C-l>', '<cmd>wincmd l<CR>')

-- Clear highlighted search
Nmap('<leader>k', '<cmd>nohlsearch<CR><C-l><cmd>echo "Search cleared"<CR>', {desc='Clear search'})

-- Delete without overwriting the copy-paste register
Keymap({'n', 'v'}, '<leader>d', '"_d', {desc='which_key_ignore'})
Keymap({'n', 'v'}, '<leader>D', '"_D', {desc='which_key_ignore'})
Keymap({'n', 'v'}, 'c', '"_c', {desc='which_key_ignore'})
Keymap({'n', 'v'}, 'C', '"_C', {desc='which_key_ignore'})
Keymap({'n', 'v'}, 'x', '"_x', {desc='which_key_ignore'})
Keymap({'n', 'v'}, 'X', '"_X', {desc='which_key_ignore'})
