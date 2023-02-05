-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Setup using default options
require('nvim-tree').setup()

nmap{'<leader>n', '<cmd>NvimTreeFindFileToggle<CR>'}
