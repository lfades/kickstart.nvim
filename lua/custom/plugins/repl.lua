vim.pack.add { 'https://github.com/pappasam/nvim-repl' }

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
