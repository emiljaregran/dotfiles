local config = function()
  require('nvim-treesitter.configs').setup({
    indent = {
      enable = true
    },
    autotag = {
      enable = true
    },
    ensure_installed = {
      'bash',
      'c',
      'cmake',
      'cpp',
      'dockerfile',
      'git_config',
      'git_rebase',
      'gitcommit',
      'gitignore',
      'json',
      'linkerscript',
      'lua',
      'make',
      'markdown',
      'proto',
      'python',
      'rust',
      'ssh_config',
      'yaml',
    },
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true
    }
  })
end

return {
  'nvim-treesitter/nvim-treesitter',
  event = 'VeryLazy',
  config = config
}
