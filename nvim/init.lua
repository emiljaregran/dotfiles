-- Entry point for Neovim configuration
require('config')

vim.cmd.colorscheme('catppuccin')

-- Enable the LSP servers
vim.lsp.enable({'clangd', 'pyright', 'rust_analyzer'})

vim.diagnostic.config({
  virtual_lines = true
})
