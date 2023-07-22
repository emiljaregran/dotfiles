-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('nvim-tree').setup({
    view = {
        width = {
            min = 30,
            max = 50
        }
    },
    filters = {
        git_ignored = false
    }
})

Nmap('<leader>n', '<cmd>NvimTreeFindFileToggle<CR>', {desc='Toggle file explorer'})
