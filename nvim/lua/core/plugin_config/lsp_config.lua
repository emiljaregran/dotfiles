require('mason').setup()
require('mason-lspconfig').setup {
  ensure_installed = { 'clangd', 'pylsp', 'lua_ls' }
}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, _)
  Nmap('K', '<cmd>lua vim.lsp.buf.hover()<CR>')
  Nmap('<C-j>', '<cmd>Telescope lsp_document_symbols<CR>')
  Nmap('<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')

  Nmap('<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
  Nmap('gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
  Nmap('gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
  Nmap('gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
  Nmap('gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
  Nmap('gr', '<cmd>Telescope lsp_references<CR>')
  Nmap('<leader>dj', '<cmd>lua vim.diagnostic.goto_next()<CR>')
  Nmap('<leader>dk', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
  Nmap('<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>')
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').pylsp.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

require('lspconfig').lua_ls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        -- Recognize the global 'vim' variable.
        globals = {'vim'}
      }
    }
  }
}

require('lspconfig').clangd.setup {
  capabilities = capabilities,
  on_attach = on_attach
}
