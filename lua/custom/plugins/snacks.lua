return {
  {
    'folke/snacks.nvim',
    config = function()
      local Snacks = require 'snacks'

      Snacks.setup {
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
        lazygit = {
          win = {
            width = 0,
            height = 0,
          },
        },
        notifier = {
          enabled = true,
          top_down = false, -- place notifications from top to bottom
        },
        image = {
          enabled = true,
          -- Apparently, all the images that you preview in neovim are converted
          -- to .png and they're cached, original image remains the same, but
          -- the preview you see is a png converted version of that image
          --
          -- Where are the cached images stored?
          -- This path is found in the docs
          -- :lua print(vim.fn.stdpath("cache") .. "/snacks/image")
          -- For me returns `~/.cache/neobean/snacks/image`
          -- Go 1 dir above and check `sudo du -sh ./* | sort -hr | head -n 5`
        },
        bigfile = {
          enabled = true,
          size = 1 * 1024 * 1024, -- 1MB
        },
        dashboard = {},
      }

      -- GIT KEYMAPS
      vim.keymap.set('n', '<leader>gl', function()
        Snacks.picker.git_log_file {
          finder = 'git_log',
          format = 'git_log',
          preview = 'git_show',
          confirm = 'git_checkout',
        }
      end, { desc = '[G]it [l]og file' })

      vim.keymap.set('n', '<leader>gL', function()
        Snacks.picker.git_log {
          finder = 'git_log',
          format = 'git_log',
          preview = 'git_show',
          confirm = 'git_checkout',
          layout = 'vertical',
        }
      end, { desc = '[G]it [L]og' })

      vim.keymap.set('n', '<leader>gB', function()
        Snacks.picker.git_branches {
          layout = 'select',
        }
      end, { desc = '[B]ranches' })

      -- SEARCH KEYMAPS
      vim.keymap.set('n', '<leader>sk', function()
        Snacks.picker.keymaps {
          layout = 'vertical',
        }
      end, { desc = '[S]earch [K]eymaps' })

      vim.keymap.set('n', '<leader>sf', function()
        Snacks.picker.files {
          finder = 'files',
          format = 'file',
          show_empty = true,
          supports_live = true,
        }
      end, { desc = '[S]earch [F]iles' })

      vim.keymap.set('n', '<leader>.', function()
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
      end, { desc = '[.] Find existing buffers' })

      vim.keymap.set('n', '<leader><leader>', function()
        Snacks.picker.recent {
          layout = 'vertical',
        }
      end, { desc = '[ ] Find Recent Files' })

      vim.keymap.set('n', '<leader>sg', function()
        Snacks.picker.grep()
      end, { desc = '[S]earch by [G]rep' })

      vim.keymap.set('n', '<leader>/', function()
        Snacks.picker.lines()
      end, { desc = '[/] Fuzzily search in current buffer' })

      vim.keymap.set('n', '<leader>sb', function()
        Snacks.picker.grep_buffers()
      end, { desc = '[S]earch by grep in [B]uffers' })

      vim.keymap.set('n', '<leader>sw', function()
        Snacks.picker.grep_word()
      end, { desc = '[S]earch current [W]ord' })

      vim.keymap.set('n', '<leader>:', function()
        Snacks.picker.command_history()
      end, { desc = '[:] Command history' })

      vim.keymap.set('n', '<leader>sc', function()
        Snacks.picker.commands()
      end, { desc = '[S]earch [C]ommands' })

      vim.keymap.set('n', '<leader>sp', function()
        Snacks.picker.lazy()
      end, { desc = '[S]earch for [P]lugin Spec' })

      vim.keymap.set('n', '<leader>sq', function()
        Snacks.picker.qflist()
      end, { desc = '[S]earch [Q]uickfix List' })

      vim.keymap.set('n', '<leader>sC', function()
        Snacks.picker.colorschemes { layout = 'ivy' }
      end, { desc = '[S]earch [C]olorschemes' })

      vim.keymap.set('n', '<leader>sh', function()
        Snacks.picker.help()
      end, { desc = '[S]earch [H]elp pages' })

      vim.keymap.set('n', '<leader>s/', function()
        Snacks.picker.search_history()
      end, { desc = '[S]earch [/]history' })

      vim.keymap.set('n', '<leader>su', function()
        Snacks.picker.undo {
          layout = 'vertical',
        }
      end, { desc = '[S]earch [U]ndo history' })

      vim.keymap.set('n', "<leader>s'", function()
        Snacks.picker.registers {
          layout = 'vertical',
        }
      end, { desc = "[S]earch [']registers" })

      vim.keymap.set('n', '<leader>sr', function()
        Snacks.picker.resume()
      end, { desc = '[S]earch [R]esume' })

      vim.keymap.set('n', '<leader>sd', function()
        Snacks.picker.diagnostics()
      end, { desc = '[S]earch [D]iagnostics' })

      vim.keymap.set('n', '<leader>sD', function()
        Snacks.picker.diagnostics_buffer {
          layout = 'ivy_split',
        }
      end, { desc = '[S]earch buffer [D]iagnostics' })

      vim.keymap.set('n', '<leader>sn', function()
        Snacks.picker.files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })

      -- FILE EXPLORER (commented out)
      -- vim.keymap.set('n', '<leader>se', function()
      --   Snacks.explorer()
      -- end, { desc = 'File [E]xplorer' })

      -- LAZYGIT
      vim.keymap.set('n', '<leader>gg', function()
        Snacks.lazygit()
      end, { desc = 'Lazy[G]it' })

      -- LSP
      vim.keymap.set('n', 'gd', function()
        Snacks.picker.lsp_definitions()
      end, { desc = 'LSP: [G]oto [D]efinition' })

      vim.keymap.set('n', 'gD', function()
        Snacks.picker.lsp_declarations()
      end, { desc = 'LSP: [G]oto [D]eclaration' })

      vim.keymap.set('n', 'grr', function()
        Snacks.picker.lsp_references()
      end, { desc = 'LSP: [G]oto [R]eferences' })

      vim.keymap.set('n', 'gI', function()
        Snacks.picker.lsp_implementations()
      end, { desc = 'LSP: [G]oto [I]mplementation' })

      vim.keymap.set('n', 'gy', function()
        Snacks.picker.lsp_type_definitions()
      end, { desc = 'LSP: [G]oto t[y]pe definition' })

      vim.keymap.set('n', 'gO', function()
        Snacks.picker.lsp_symbols()
      end, { desc = 'LSP: [O]pen document symbols' })

      vim.keymap.set('n', 'gW', function()
        Snacks.picker.lsp_workspace_symbols()
      end, { desc = 'LSP: Open [W]orkspace symbols' })
    end,
  },
}
