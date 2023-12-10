return {
    'catppuccin/nvim',
    lazy = false,    -- Load the colorscheme immediately when starting Neovim.
    priority = 1000, -- Load the colorscheme before other non-lazy-loaded plugins
    config = function()
        vim.g.catppuccin_flavour = 'macchiato'
        vim.cmd('colorscheme catppuccin')
    end
}
