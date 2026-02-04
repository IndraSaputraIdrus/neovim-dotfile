return {
  'nvim-mini/mini.nvim',
  version = false,
  config = function()
    local icons = require('mini.icons')
    icons.setup()
    icons.mock_nvim_web_devicons()

    require('mini.files').setup()
    vim.keymap.set('n', '-', '<cmd>lua MiniFiles.open()<cr>')

    local pick = require('mini.pick')
    pick.setup()

    vim.keymap.set('n', '<leader>ff', pick.builtin.files)
    vim.keymap.set('n', '<leader>fg', pick.builtin.grep)
    vim.keymap.set('n', '<leader>sg', pick.builtin.grep_live)
    vim.keymap.set('n', '<leader>sh', pick.builtin.help)

    vim.keymap.set('n', '<leader>fr', '<cmd>lua MiniExtra.pickers.lsp()<cr>')

    local extra = require('mini.extra')
    extra.setup()

    vim.keymap.set('n', '<leader>sd', extra.pickers.diagnostic)

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('telescope-lsp-attach', { clear = true }),
      callback = function(event)
        local buf = event.buf

        vim.keymap.set('n', '<leader>grr', function()
          extra.pickers.lsp({ scope = 'references' })
        end, { buffer = buf, desc = 'Goto References' })

        vim.keymap.set('n', '<leader>grd', function()
          extra.pickers.lsp({ scope = 'definitions' })
        end, { buffer = buf, desc = 'Goto Definitions' })

        vim.keymap.set('n', '<leader>grd', function()
          extra.pickers.lsp({ scope = 'definitions' })
        end, { buffer = buf, desc = 'Goto Definitions' })

        vim.keymap.set('n', '<leader>gri', function()
          extra.pickers.lsp({ scope = 'implementation' })
        end, { buffer = buf, desc = 'Goto Implementation' })

        vim.keymap.set('n', '<leader>gO', function()
          extra.pickers.lsp({ scope = 'document_symbol' })
        end, { buffer = buf, desc = 'Open Document Symbols' })

        vim.keymap.set('n', '<leader>grt', function()
          extra.pickers.lsp({ scope = 'type_definition' })
        end, { buffer = buf, desc = 'Goto Type Definition' })
      end,
    })

    require('mini.statusline').setup()
    require('mini.tabline').setup()
    require('mini.ai').setup()
    require('mini.surround').setup()
  end,
}
