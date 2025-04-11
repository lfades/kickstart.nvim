return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup {
      settings = {
        save_on_toggle = true,
      },
    }

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
  end,
}
