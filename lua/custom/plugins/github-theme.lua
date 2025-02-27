return {
  'projekt0n/github-nvim-theme',
  enabled = false,
  name = 'github-theme',
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require('github-theme').setup()
    vim.cmd.colorscheme 'github_dark_default'
  end,
}
