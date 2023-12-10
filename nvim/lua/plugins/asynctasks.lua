local keymap = vim.keymap

return {
  'skywind3000/asynctasks.vim',
  event = 'VeryLazy',
  config = function()
    vim.g.asyncrun_open = 8 -- Set the quickfix window 8 lines height.
    keymap.set('n', '<F5>', '<cmd>AsyncRun -cwd=<root> make flash<CR>')
    keymap.set('n', '<F6>', '<cmd>AsyncRun -cwd=<root> make test<CR>')
    keymap.set('n', '<F7>', '<cmd>AsyncRun -cwd=<root> make<CR>')
  end,
  dependencies = 'skywind3000/asyncrun.vim'
}
