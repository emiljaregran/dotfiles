-- Telescope Setup
local action_state = require('telescope.actions.state') -- runtime (Plugin) exists somewhere as lua/telescope/actions/state.lua
require('telescope').setup{
  defaults = {
      prompt_prefix = "🔍 ",
      mappings = {
          i = {
            ["<c-a>"] = function() print(vim.inspect(action_state.get_selected_entry())) end
          }
      }
  }
}
require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')

Nmap('<C-f>', '<cmd>Telescope current_buffer_fuzzy_find sorting_strategy=ascending prompt_position=top<CR>')
Nmap('<leader>ff', '<cmd>Telescope find_files<CR>', {desc='Telescope Find files'})
Nmap('<leader>fg', '<cmd>Telescope live_grep<CR>', {desc='Telescope Live grep'})
Nmap('<leader>fm', '<cmd>Telescope man_pages<CR>', {desc='Telescope Man pages'})

local mappings = {}

mappings.curr_buf = function()
  local opt = require('telescope.themes').get_dropdown({height=10, previewer=false})
  require('telescope.builtin').current_buffer_fuzzy_find(opt)
end

return mappings
