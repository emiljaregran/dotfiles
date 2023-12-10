local config = function()
  require('neorg').setup {
    load = {
      ['core.defaults'] = {},  -- Loads default behaviour
      ['core.concealer'] = {}, -- Adds pretty icons to your documents
      ['core.dirman'] = {      -- Manages Neorg workspaces
        config = {
          workspaces = {
            notes = '~/Documents/notes'
          },
          default_workspace = 'notes'
        }
      }
    }
  }
end

return {
  'nvim-neorg/neorg',
  event = 'VeryLazy',
  config = config
}
