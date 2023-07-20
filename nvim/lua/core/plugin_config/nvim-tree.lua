-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('nvim-tree').setup({
    view = {
        width = {
            min = 30,
            max = 50
        }
    }
})

Nmap('<leader>n', '<cmd>NvimTreeFindFileToggle<CR>')
