require('mason').setup()
require('mason-lspconfig').setup {
  ensure_installed = { 'clangd', 'pylsp', 'sumneko_lua' }
}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, _)
  nmap{'K', '<cmd>lua vim.lsp.buf.hover()<CR>'}
  nmap{'<C-j>', '<cmd>Telescope lsp_document_symbols<CR>'}
  nmap{'<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>'}

  nmap{'<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>'}
  nmap{'gd', '<cmd>lua vim.lsp.buf.definition()<CR>'}
  nmap{'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>'}
  nmap{'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>'}
  nmap{'gr', '<cmd>Telescope lsp_references<CR>'}
  nmap{'<leader>dj', '<cmd>lua vim.diagnostic.goto_next()<CR>'}
  nmap{'<leader>dk', '<cmd>lua vim.diagnostic.goto_prev()<CR>'}
  nmap{'<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>'}
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').pylsp.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

require('lspconfig').sumneko_lua.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

require('lspconfig').clangd.setup {
  capabilities = capabilities,
  on_attach = on_attach
}
