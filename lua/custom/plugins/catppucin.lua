vim.pack.add { { src = 'https://github.com/catppuccin/nvim', name = 'catppuccin' } }

require('catppuccin').setup {
  flavour = 'mocha',
  -- transparent_background = true,

  -- Dark background.
  -- color_overrides = {
  --   mocha = {
  --     base = '#000000',
  --     mantle = '#000000',
  --     crust = '#000000',
  --   },
  -- },

  -- Make it look pink.
  -- color_overrides = {
  --   mocha = {
  --     text = '#F4CDE9',
  --     subtext1 = '#DEBAD4',
  --     subtext0 = '#C8A6BE',
  --     overlay2 = '#B293A8',
  --     overlay1 = '#9C7F92',
  --     overlay0 = '#866C7D',
  --     surface2 = '#705867',
  --     surface1 = '#5A4551',
  --     surface0 = '#44313B',
  --
  --     base = '#352939',
  --     mantle = '#211924',
  --     crust = '#1a1016',
  --   },
  -- },
  color_overrides = {
    mocha = {
      rosewater = '#feecee',
      flamingo = '#ea3e83',
      pink = '#f75f8f',
      mauve = '#bf7af0',
      red = '#ff6166',
      maroon = '#e5484d',
      peach = '#ff990a',
      yellow = '#ffb224',
      green = '#62c073',
      teal = '#0ac7b4',
      sky = '#0090ff',
      sapphire = '#0072f5',
      blue = '#52a8ff',
      lavender = '#ebf6ff',
      text = '#ededed',
      subtext1 = '#a1a1a1',
      subtext0 = '#8f8f8f',
      overlay2 = '#878787',
      overlay1 = '#7d7d7d',
      overlay0 = '#666666',
      surface2 = '#454545',
      surface1 = '#2e2e2e',
      surface0 = '#1a1a1a',
      base = '#0a0a0a',
      mantle = '#000000',
      crust = '#000000',
    },
  },
  custom_highlights = function(C)
    return {
      -- Vercel syntax: purple functions, pink keywords, blue constants
      Function = { fg = C.mauve },
      ['@function'] = { fg = C.mauve },
      ['@function.call'] = { fg = C.mauve },
      ['@function.method'] = { fg = C.mauve },
      ['@function.method.call'] = { fg = C.mauve },
      Keyword = { fg = C.pink },
      ['@keyword'] = { fg = C.pink },
      ['@keyword.function'] = { fg = C.pink },
      ['@keyword.return'] = { fg = C.pink },
      Constant = { fg = C.blue },
      Number = { fg = C.blue },
      Boolean = { fg = C.blue },
      ['@constant'] = { fg = C.blue },
      ['@number'] = { fg = C.blue },
      ['@boolean'] = { fg = C.blue },
      ['@variable.parameter'] = { fg = C.peach },
      Comment = { fg = C.subtext1 },
      ['@comment'] = { fg = C.subtext1 },
      Operator = { fg = C.text },
      ['@punctuation'] = { fg = C.overlay2 },
      LineNr = { fg = C.overlay1 },
      CursorLineNr = { fg = C.text },
      Visual = { bg = C.surface1 },
      Search = { bg = C.surface2, fg = C.text },
    }
  end,
}

vim.cmd.colorscheme 'catppuccin'
