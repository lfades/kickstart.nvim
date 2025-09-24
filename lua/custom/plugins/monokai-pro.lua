return {
  'loctvl842/monokai-pro.nvim',
  enabled = false,
  priority = 1000,
  name = 'monokai-pro',
  config = function()
    require('monokai-pro').setup {
      filter = 'pro', -- classic | octagon | pro | machine | ristretto | spectrum
    }
    vim.cmd.colorscheme 'monokai-pro'
  end,
}
