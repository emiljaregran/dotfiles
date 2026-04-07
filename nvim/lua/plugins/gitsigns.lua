-- Git integration for buffers
return {
  src = 'https://github.com/lewis6991/gitsigns.nvim',
  setup = function()
    require('gitsigns').setup({
      sign_priority = 10,
      update_debounce = 100,
      status_formatter = nil,
      max_file_length = 10000,
      current_line_blame_formatter = '      <author>, <author_time:%R> - <summary>',
      signs = {
        untracked    = { text = '┆'  },
        add          = { text = '▕'  },
        change       = { text = '▕'  },
        changedelete = { text = '━━' },
        delete       = { text = '▁▁' },
        topdelete    = { text = '▔▔' },
      },
      signcolumn = true,
      numhl      = false,
      linehl     = false,
      word_diff  = false,
      watch_gitdir = {
        interval = 1000,
        follow_files = true
      },
      attach_to_untracked = true,
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol',
        delay = 1000,
        ignore_whitespace = false,
      },
      preview_config = {
        -- Options passed to nvim_open_win
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
      },
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, lhs, rhs)
          vim.keymap.set(mode, lhs, rhs, { buffer = buffer })
        end

        map("n", "gn", function() gs.nav_hunk("next") end)
        map("n", "gm", function() gs.nav_hunk("prev") end)
      end,
    });
  end,
}
