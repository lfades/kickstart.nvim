return {
  {
    'folke/snacks.nvim',
    ---@type snacks.Config
    opts = {
      picker = {
        win = {
          input = {
            keys = {
              ['<Esc>'] = { 'close', mode = { 'n', 'i' } },
              ['<C-c>'] = false,
            },
          },
        },
        layout = {
          cycle = false,
        },
        matcher = {
          frecency = true,
        },
        formatters = {
          file = {
            filename_first = true, -- display filename before the file path
            truncate = 80,
          },
        },
      },
    },
    keys = {
      -- I use this keymap with mini.files, but snacks explorer was taking over
      -- https://github.com/folke/snacks.nvim/discussions/949
      { '<leader>e', false },
      -- GIT
      {
        '<leader>gl',
        function()
          Snacks.picker.git_log {
            finder = 'git_log',
            format = 'git_log',
            preview = 'git_show',
            confirm = 'git_checkout',
            layout = 'vertical',
          }
        end,
        desc = 'Git [L]og',
      },
      {
        '<leader>gb',
        function()
          Snacks.picker.git_branches {
            layout = 'select',
          }
        end,
        desc = '[B]ranches',
      },
      -- SEARCH
      {
        '<leader>sk',
        function()
          Snacks.picker.keymaps {
            layout = 'vertical',
          }
        end,
        desc = '[S]earch [K]eymaps',
      },
      {
        '<leader>sf',
        function()
          Snacks.picker.files {
            finder = 'files',
            format = 'file',
            show_empty = true,
            supports_live = true,
            layout = 'sidebar',
          }
        end,
        desc = '[S]earch [F]iles',
      },
      {
        '<leader><leader>',
        function()
          Snacks.picker.buffers {
            -- I always want my buffers picker to start in normal mode
            on_show = function()
              vim.cmd.stopinsert()
            end,
            finder = 'buffers',
            format = 'buffer',
            hidden = false,
            unloaded = true,
            current = true,
            sort_lastused = true,
            win = {
              input = {
                keys = {
                  ['d'] = 'bufdelete',
                },
              },
              list = { keys = { ['d'] = 'bufdelete' } },
            },
            layout = 'ivy',
          }
        end,
        desc = '[ ] Find existing buffers',
      },
      {
        '<leader>s.',
        function()
          Snacks.picker.recent()
        end,
        desc = '[S]earch Recent Files ("." for repeat)',
      },
      {
        '<leader>sg',
        function()
          Snacks.picker.grep()
        end,
        desc = '[S]earch by [G]rep',
      },
      {
        '<leader>/',
        function()
          Snacks.picker.lines()
        end,
        desc = '[/] Fuzzily search in current buffer',
      },
      {
        '<leader>sb',
        function()
          Snacks.picker.grep_buffers()
        end,
        desc = '[S]earch by grep in [B]uffers',
      },
      {
        '<leader>sw',
        function()
          Snacks.picker.grep_word()
        end,
        desc = '[S]earch current [W]ord',
      },
      {
        '<leader>:',
        function()
          Snacks.picker.command_history()
        end,
        desc = '[:] Command history',
      },
      {
        '<leader>sc',
        function()
          Snacks.picker.commands()
        end,
        desc = '[S]earch [C]ommands',
      },
      {
        '<leader>sp',
        function()
          Snacks.picker.lazy()
        end,
        desc = '[S]earch for [P]lugin Spec',
      },
      {
        '<leader>sq',
        function()
          Snacks.picker.qflist()
        end,
        desc = '[S]earch [Q]uickfix List',
      },
      {
        '<leader>sC',
        function()
          Snacks.picker.colorschemes()
        end,
        desc = '[S]earch [C]olorschemes',
      },
      {
        '<leader>sh',
        function()
          Snacks.picker.help()
        end,
        desc = '[S]earch [H]elp pages',
      },
      {
        '<leader>s/',
        function()
          Snacks.picker.search_history()
        end,
        desc = '[S]earch [/]history',
      },
      {
        '<leader>su',
        function()
          Snacks.picker.undo()
        end,
        desc = '[S]earch [U]ndo history',
      },
      {
        '<leader>sr',
        function()
          Snacks.picker.resume()
        end,
        desc = '[S]earch [R]esume',
      },
      {
        '<leader>sd',
        function()
          Snacks.picker.diagnostics()
        end,
        desc = '[S]earch [D]iagnostics',
      },
      {
        '<leader>sD',
        function()
          Snacks.picker.diagnostics_buffer()
        end,
        desc = '[S]earch buffer [D]iagnostics',
      },
      {
        '<leader>sn',
        function()
          Snacks.picker.files { cwd = vim.fn.stdpath 'config' }
        end,
        desc = '[S]earch [N]eovim files',
      },
      -- FILE EXPLORER
      -- {
      --   '<leader>se',
      --   function()
      --     Snacks.explorer()
      --   end,
      --   desc = 'File [E]xplorer',
      -- },
    },
  },
}
