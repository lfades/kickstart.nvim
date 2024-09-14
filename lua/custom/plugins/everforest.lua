return {
  'sainnhe/everforest',
  name = 'everforest',
  enabled = false,
  lazy = false,
  priority = 1000,
  config = function()
    -- directly inside the plugin declaration.
    vim.g.everforest_background = 'hard'
    vim.g.everforest_enable_italic = true
    vim.g.everforest_transparent_background = 1
    vim.g.everforest_current_word = 'underline'

    vim.cmd.colorscheme 'everforest'
    vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = 'none' })
  end,
}
