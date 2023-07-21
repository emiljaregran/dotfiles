require('gitsigns').setup {
  current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`

  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, lhs, rhs, opts)
      opts = opts or {}
      opts.buffer = bufnr
      Keymap(mode, lhs, rhs, opts)
    end

    -- Navigation
    map('n', '<leader>gn', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr=true, desc='Git Next hunk'})

    map('n', '<leader>gp', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr=true, desc='Git Previous hunk'})

    -- Actions
    map({'n', 'v'}, '<leader>gs', '<cmd>Gitsigns stage_hunk<CR>', {desc='Git Stage hunk'})
    map({'n', 'v'}, '<leader>gr', '<cmd>Gitsigns reset_hunk<CR>', {desc='Git Reset hunk'})
    map('n', '<leader>gb', function() gs.blame_line{full=true} end, {desc='Git Blame'})
    map('n', '<leader>gd', gs.diffthis, {desc='Git Diff'})
    map('n', '<leader>gt', gs.toggle_deleted, {desc='Git Toggle deleted'})
    map('n', '<leader>gl', gs.toggle_current_line_blame, {desc='Git Toggle current line blame'})

  end
}
