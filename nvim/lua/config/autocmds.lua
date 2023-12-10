local autocmd = vim.api.nvim_create_autocmd

-- Don't continue comments with "o" command
autocmd('BufEnter', {
  pattern = '',
  command = 'set formatoptions=tcrq'
})
