return {
  'loctvl842/monokai-pro.nvim',
  enabled = false,
  name = 'monokai-pro',
  priority = 1000,
  config = function()
    require('monokai-pro').setup {
      filter = 'pro', -- classic | octagon | pro | machine | ristretto | spectrum
    }
    vim.cmd.colorscheme 'monokai-pro'
  end,
}
