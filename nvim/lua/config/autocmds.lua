-- Don't continue comments with "o" command.
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '',
  command = 'set formatoptions=tcrq'
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then return end

    -- Enable native LSP completion
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, args.buf, {autotrigger = true})

      local opts = { noremap = true, silent = true, buffer = args.buf }
      vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
      vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
      vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
      vim.keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
      vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)

      -- <Enter> = Accept selected item
      vim.keymap.set('i', '<CR>', function()
        if vim.fn.pumvisible() == 1 then
          local info = vim.fn.complete_info({ 'selected' })
          if info.selected == -1 then
            return '<C-n><C-y>' -- No explicit selection → force first item
          else
            return '<C-y>'
          end
        end
        return '<CR>'           -- Normal newline when no menu open
      end, { buffer = args.buf, expr = true })
    end
  end,
})

-- Resize splits if window got resized.
vim.api.nvim_create_autocmd({ "VimResized" }, {
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})
