vim.pack.add {
  { src = 'https://github.com/ThePrimeagen/harpoon', version = 'harpoon2' },
  'https://github.com/nvim-lua/plenary.nvim',
}

local harpoon = require 'harpoon'
harpoon:setup {
  settings = {
    save_on_toggle = true,
  },
}

-- Workaround for harpoon2 bug: function references in HarpoonConfig cause
-- json_encode to fail during BufLeave/VimLeave autocmds.
-- HarpoonConfig is a global variable in harpoon's init.lua, so we can
-- temporarily sanitize it before save.
local function clean_table(t)
  local res = {}
  for k, v in pairs(t) do
    if type(v) == 'function' then
      -- skip function values
    elseif type(v) == 'table' then
      res[k] = clean_table(v)
    else
      res[k] = v
    end
  end
  return res
end

local orig_save = harpoon.save
harpoon.save = function()
  local _G = _G
  local orig_config = _G.HarpoonConfig
  if orig_config then
    _G.HarpoonConfig = clean_table(orig_config)
  end
  local ok, err = pcall(orig_save)
  if orig_config then
    _G.HarpoonConfig = orig_config
  end
  if not ok then
    vim.notify('Harpoon save failed (non-fatal): ' .. tostring(err), vim.log.levels.WARN)
  end
end

vim.keymap.set('n', '<leader>hs', function()
  harpoon:list():add()
end, { desc = 'Add' })
vim.keymap.set('n', '<leader>ha', function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = 'Toggle [M]enu' })
vim.keymap.set('n', '<leader>hf', function()
  harpoon:list():select(1)
end, { desc = 'Select 1' })
vim.keymap.set('n', '<leader>hd', function()
  harpoon:list():select(2)
end, { desc = 'Select 2' })
vim.keymap.set('n', '<leader>hr', function()
  harpoon:list():select(3)
end, { desc = 'Select 3' })
vim.keymap.set('n', '<leader>he', function()
  harpoon:list():select(4)
end, { desc = 'Select 4' })
vim.keymap.set('n', '<leader>hw', function()
  harpoon:list():select(5)
end, { desc = 'Select 5' })
vim.keymap.set('n', '<leader>hq', function()
  harpoon:list():select(6)
end, { desc = 'Select 6' })
-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set('n', '<leader>hz', function()
  harpoon:list():prev()
end, { desc = 'Previous' })
vim.keymap.set('n', '<leader>hc', function()
  harpoon:list():next()
end, { desc = 'Next' })

-- SNACKS KEYMAPS
local normalize_list = function(t)
  local normalized = {}
  for _, v in pairs(t) do
    if v ~= nil then
      table.insert(normalized, v)
    end
  end
  return normalized
end

vim.keymap.set('n', '<leader>hh', function()
  Snacks.picker {
    layout = 'ivy',
    finder = function()
      local file_paths = {}
      local list = normalize_list(harpoon:list().items)
      for i, item in ipairs(list) do
        table.insert(file_paths, { text = item.value, file = item.value })
      end
      return file_paths
    end,
    win = {
      input = {
        keys = { ['dd'] = { 'harpoon_delete', mode = { 'n', 'x' } } },
      },
      list = {
        keys = { ['dd'] = { 'harpoon_delete', mode = { 'n', 'x' } } },
      },
    },
    actions = {
      harpoon_delete = function(picker, item)
        local to_remove = item or picker:selected()
        harpoon:list():remove { value = to_remove.text }
        harpoon:list().items = normalize_list(harpoon:list().items)
        picker:find { refresh = true }
      end,
    },
  }
end)
