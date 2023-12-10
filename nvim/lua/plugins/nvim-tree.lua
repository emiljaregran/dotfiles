return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  opts = {
    view = {
        width = {
            min = 30,
            max = 50
        }
    },
    filters = {
        git_ignored = false
    }
  },
  keys = {
    { '<leader>n', ':NvimTreeFindFileToggle<CR>', desc = 'File explorer', silent = true }
  }
}
