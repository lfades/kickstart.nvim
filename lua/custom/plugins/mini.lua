-- mini.files configuration only.
-- mini.ai, mini.surround, and mini.statusline are configured in init.lua.

vim.keymap.set('n', '<leader>e', function()
  local buf_name = vim.api.nvim_buf_get_name(0)
  local dir_name = vim.fn.fnamemodify(buf_name, ':p:h')
  if vim.fn.filereadable(buf_name) == 1 then
    -- Pass the full file path to highlight the file
    require('mini.files').open(buf_name, true)
  elseif vim.fn.isdirectory(dir_name) == 1 then
    -- If the directory exists but the file doesn't, open the directory
    require('mini.files').open(dir_name, true)
  else
    -- If neither exists, fallback to the current working directory
    require('mini.files').open(vim.uv.cwd(), true)
  end
end, { desc = 'Open mini.files in the current directory' })

vim.keymap.set('n', '<leader>E', function()
  require('mini.files').open(vim.uv.cwd(), true)
end, { desc = 'Open mini.files (cwd)' })

require('mini.files').setup {
  mappings = {
    reveal_cwd = '.',
  },
  windows = {
    preview = true,
    width_focus = 30,
    width_preview = 30,
  },
  options = {
    -- Whether to use for editing directories
    -- Disabled by default in LazyVim because neo-tree is used for that
    use_as_default_explorer = true,
    -- If set to false, files are moved to the trash directory in:
    -- /Users/fades/.local/share/nvim/mini.files/trash
    permanent_delete = false,
  },
}
