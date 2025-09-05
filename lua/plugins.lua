-- Clone 'mini.nvim' manually in a way that it gets managed by 'mini.deps'
local path_package = vim.fn.stdpath 'data' .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
  vim.cmd 'echo "Installing `mini.nvim`" | redraw'
  local clone_cmd = {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/nvim-mini/mini.nvim',
    mini_path,
  }
  vim.fn.system(clone_cmd)
  vim.cmd 'packadd mini.nvim | helptags ALL'
  vim.cmd 'echo "Installed `mini.nvim`" | redraw'
end

-- Set up 'mini.deps' (customize to your liking)
require('mini.deps').setup { path = { package = path_package } }

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

-- Color scheme
now(function()
  vim.o.termguicolors = true
  vim.cmd 'colorscheme miniautumn'
end)

-- Mini
now(function()
  require('mini.icons').setup()
  require('mini.statusline').setup()
  require('mini.tabline').setup()
end)

later(function()
  require('mini.ai').setup()
  require('mini.pick').setup()
  require('mini.files').setup()
  require('mini.extra').setup()

  vim.keymap.set('n', '<leader>ff', '<CMD>:Pick files<CR>', { desc = 'Open file picker' })
  vim.keymap.set('n', '-', '<CMD>lua MiniFiles.open()<CR>', { desc = 'Open File Manager' })
  vim.keymap.set('n', 'grr', '<CMD>lua MiniExtra.pickers.lsp({ scope = "references" })<CR>', { desc = 'LSP buf refenrences' })
  vim.keymap.set('n', 'grD', '<CMD>lua MiniExtra.pickers.diagnostic()<CR>', { desc = 'LSP buf diagnostic' })
  vim.keymap.set('n', 'grq', '<CMD>lua MiniExtra.pickers.list({ scope = "quickfix" })<CR>', { desc = 'LSP buf quickfix' })
end)

-- Treesitter
later(function()
  add {
    source = 'nvim-treesitter/nvim-treesitter',
    checkout = 'master',
    monitor = 'main',
    hooks = {
      post_checkout = function()
        vim.cmd 'TSUpdate'
      end,
    },
  }
  require('nvim-treesitter.configs').setup {
    ensure_installed = { 'lua', 'vimdoc', 'typescript', 'javascript', 'svelte' },
    highlight = { enable = true },
  }
end)

-- LSP
now(function()
  add {
    source = 'neovim/nvim-lspconfig',
    -- Supply dependencies near target plugin
    depends = { 'williamboman/mason.nvim', 'j-hui/fidget.nvim' },
  }

  require('mason').setup {}
  require('fidget').setup {}

  vim.lsp.enable { 'lua_ls', 'ts_ls', 'biome', 'eslint', 'svelte' }
  vim.lsp.config('lua_ls', {
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim', 'MiniDeps' },
        },
      },
    },
  })

  vim.keymap.set('n', 'grd', vim.lsp.buf.definition, { desc = '' })
end)

-- Conform
later(function()
  add {
    source = 'stevearc/conform.nvim',
  }

  -- Run the first available formatter followed by more formatters
  local function first(bufnr, ...)
    local conform = require 'conform'
    for i = 1, select('#', ...) do
      local formatter = select(i, ...)
      if conform.get_formatter_info(formatter, bufnr).available then
        return formatter
      end
    end
    return select(1, ...)
  end

  require('conform').setup {
    formatters_by_ft = {
      lua = { 'stylua' },
      svelte = { 'prettierd' },
      typescript = function(bufnr)
        return { first(bufnr, 'biome', 'prettierd'), 'biome-organize-imports' }
      end,
      javascript= function(bufnr)
        return { first(bufnr, 'biome', 'prettierd'), 'biome-organize-imports' }
      end,
      typescriptreact = { 'prettierd' },
      javascriptreact = { 'prettierd' },
      css = { 'biome' },
      nix = { 'nixfmt' },
      json = { 'biome' },
    },
  }

  vim.keymap.set('n', '<leader>fm', "<cmd>lua require('conform').format({ lsp_format = 'fallback', async = true })<cr>", { desc = 'Format with conform' })
end)

-- Auto completion
later(function()
  add {
    source = 'Saghen/blink.cmp',
    checkout = 'v1.6.0',
  }

  require('blink.cmp').setup {
    keymap = {
      preset = 'enter',
    },
  }
end)

-- Guest intent
later(function()
  add {
    source = 'NMAC427/guess-indent.nvim',
  }
  require('guess-indent').setup {}
end)

-- Linter
later(function()
  add {
    source = 'mfussenegger/nvim-lint',
  }

  local lint = require 'lint'
  lint.linters_by_ft = {
    json = { 'biomejs' },
    javascript = { 'biomejs' },
    typescript = { 'biomejs' },
    svelte = { 'eslint_d' },
  }

  local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
  vim.api.nvim_create_autocmd('BufWritePost', {
    group = lint_augroup,
    callback = function()
      if vim.bo.modifiable then
        lint.try_lint()
      end
    end,
  })
end)
