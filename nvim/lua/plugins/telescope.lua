local keymap = vim.keymap

local config = function()
  local telescope = require('telescope')
  telescope.setup({
    defaults = {
      mappings = {
        i = {
          ['<C-j>'] = 'move_selection_next',
          ['<C-k>'] = 'move_selection_previous'
        }
      }
    },
    pickers = {
      find_files = {
        theme = 'dropdown',
        previewer = false,
        hidden = true
      }
    }
  })
end

return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  dependencies = { 'nvim-lua/plenary.nvim' },
  event = 'VeryLazy',
  config = config,
  keys = {
    keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<CR>'),
    keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<CR>'),
    keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<CR>')
  }
}
