-- A file explorer tree
return {
  src = 'https://github.com/nvim-tree/nvim-tree.lua',
  setup = function()
    require('nvim-tree').setup({
      vim.keymap.set('n', '<leader>n', '<cmd>NvimTreeFindFileToggle<CR>')
    });
  end,
}
