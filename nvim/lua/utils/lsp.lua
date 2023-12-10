local keymap = vim.keymap
local M = {}

-- Set keymaps on the active LSP server.
M.on_attach = function(_, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  keymap.set('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)
end

M.diagnostic_signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = "" }

return M
