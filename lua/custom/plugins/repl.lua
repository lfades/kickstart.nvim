return {
  'pappasam/nvim-repl',
  init = function()
    vim.g['repl_filetype_commands'] = {
      bash = 'bash',
      javascript = 'node',
      haskell = 'ghci',
      ocaml = { cmd = 'utop', suffix = ';;' },
      python = 'ipython --no-autoindent',
      r = 'R',
      sh = 'sh',
      vim = 'nvim --clean -ERM',
      zsh = 'zsh',
    }
  end,
  -- keys = {
  --   { '<Leader>cc', '<Cmd>ReplNewCell<CR>', mode = 'n', desc = 'Create New Cell' },
  --   { '<Leader>cr', '<Plug>(ReplSendCell)', mode = 'n', desc = 'Send Repl Cell' },
  --   { '<Leader>r', '<Plug>(ReplSendLine)', mode = 'n', desc = 'Send Repl Line' },
  --   { '<Leader>r', '<Plug>(ReplSendVisual)', mode = 'x', desc = 'Send Repl Visual Selection' },
  -- },
}
