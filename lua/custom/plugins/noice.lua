return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = {
    lsp = {
      override = {
        -- Change how markdown is rendered in hover and signature help.
        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
        ['vim.lsp.util.stylize_markdown'] = true,
      },
      signature = {
        enabled = false,
      },
    },
    presets = {
      bottom_search = true, -- use a classic bottom cmdline for search
      command_palette = true, -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = false, -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = true,
    },
    -- Show the @recording message of macros.
    routes = {
      {
        view = 'notify',
        filter = { event = 'msg_showmode' },
      },
    },
    commands = {
      -- Makes the history command show all messages, including "echo"
      history = {
        filter = {
          any = {
            {
              cond = function(_)
                return true
              end,
            },
          },
        },
      },
    },
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    'MunifTanjim/nui.nvim',
  },
}
