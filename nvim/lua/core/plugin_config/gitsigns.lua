require('gitsigns').setup {
  current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`

  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', '<leader>gh.', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    map('n', '<leader>g,', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    -- Actions
    map({'n', 'v'}, '<leader>gs', '<cmd>Gitsigns stage_hunk<CR>')
    map({'n', 'v'}, '<leader>gr', '<cmd>Gitsigns reset_hunk<CR>')
    map('n', '<leader>gb', function() gs.blame_line{full=true} end)
    map('n', '<leader>gd', gs.diffthis)
    map('n', '<leader>gt', gs.toggle_deleted)

  end
}
