local on_attach = require("utils.lsp").on_attach

local config = function()
  require('neoconf').setup({})
  local cmp_nvim_lsp = require('cmp_nvim_lsp')
  local lspconfig = require('lspconfig')
  local capabilities = cmp_nvim_lsp.default_capabilities()

  -- C/C++
  lspconfig.clangd.setup({
    capabilities = capabilities,
    on_attach = on_attach
  })

  -- Lua
  lspconfig.lua_ls.setup({
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
  })

  -- Python
  lspconfig.pylsp.setup({
    capabilities = capabilities,
    on_attach = on_attach
  })
end

return {
  'neovim/nvim-lspconfig',
  config = config,
  event = 'VeryLazy',
  dependencies = {
    'williamboman/mason.nvim',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-nvim-lsp'
  }
}
