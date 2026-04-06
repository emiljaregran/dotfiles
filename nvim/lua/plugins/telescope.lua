-- Fuzzy finder for grep and files
return {
  src = 'https://github.com/nvim-telescope/telescope.nvim',
  setup = function()
    require('telescope').setup({
      mappings = {
        i = {
          ['<C-j>'] = 'move_selection_next',
          ['<C-k>'] = 'move_selection_previous'
        }
      },
      pickers = {
        find_files = {
          theme = 'dropdown',
          previewer = false,
          hidden = true
        }
      }
    });

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files)
    vim.keymap.set('n', '<leader>fg', builtin.live_grep)
  end,
}
