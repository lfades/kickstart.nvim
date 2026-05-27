vim.pack.add { 'https://github.com/zbirenbaum/copilot.lua' }

require('copilot').setup {
  suggestion = { enabled = false },
  panel = { enabled = false },
}
