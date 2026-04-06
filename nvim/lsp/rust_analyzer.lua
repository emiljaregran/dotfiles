return {
  cmd = { 'rust-analyzer' },
  root_markers = { 'Cargo.toml', '.git' },
  filetypes = { 'rust' },
  settings = {
    ['rust-analyzer'] = {
      cargo = {
        allFeatures = true,
        buildScripts = { enable = true },
      },
      check = {
        command = 'clippy', -- change to "check" if you prefer faster checks
      },
      procMacro = {
        enable = true,
      },
      inlayHints = {
        enable = true,
        bindingModeHints = { enable = true },
        closureCaptureHints = { enable = true },
        closureReturnTypeHints = { enable = 'always' },
        lifetimeElisionHints = { enable = 'always' },
      },
    },
  },
}
