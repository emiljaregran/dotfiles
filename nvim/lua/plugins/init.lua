local plugins = {
  require("plugins.gitsigns"),
  require("plugins.nvim_tree"),
  require('plugins.plenary'),
  require('plugins.telescope'),
}

vim.pack.add(vim.tbl_map(function(p) return p.src or p end, plugins))

for _, p in ipairs(plugins) do
  if p.setup then p.setup() end
end
