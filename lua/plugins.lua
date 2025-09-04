vim.pack.add {
  { src = 'https://github.com/nvim-mini/mini.files', version = 'stable' },
  { src = 'https://github.com/nvim-mini/mini.pick', version = 'stable' },
  { src = 'https://github.com/nvim-mini/mini.statusline', version = 'stable' },
  { src = 'https://github.com/nvim-mini/mini.tabline', version = 'stable' },
  { src = 'https://github.com/nvim-mini/mini.icons', version = 'stable' },
  { src = 'https://github.com/nvim-mini/mini.ai', version = 'stable' },
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/mason-org/mason.nvim' },
  { src = 'https://github.com/folke/tokyonight.nvim' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },
  { src = 'https://github.com/stevearc/conform.nvim' },
  { src = 'https://github.com/mfussenegger/nvim-lint' },
  { src = 'https://github.com/NMAC427/guess-indent.nvim' },
  { src = 'https://github.com/j-hui/fidget.nvim' },
}

-- Colorscheme
vim.cmd [[colorscheme tokyonight-night]]

-- Mini.files
require('mini.files').setup {}

-- Mini.pick
require('mini.pick').setup {}

-- Mini
require('mini.statusline').setup {}
require('mini.tabline').setup {}
require('mini.ai').setup {}
local icons = require 'mini.icons'
icons.setup {}
icons.tweak_lsp_kind()

-- Guest Indent
require('guess-indent').setup {}

-- Lsp
require('mason').setup {}
require('fidget').setup {}
vim.lsp.enable { 'lua_ls', 'ts_ls', 'biome', 'svelte' }
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
})

-- Treesitter
local treesitter = require 'nvim-treesitter'
treesitter.setup {}
treesitter.install { 'javascript', 'typescript', 'json', 'html', 'css', 'svelte', 'lua' }
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('indra.config', { clear = true }),
  callback = function(ev)
    local lang = vim.treesitter.language.get_lang(ev.match)
    if vim.treesitter.language.add(lang) then
      vim.treesitter.start()
    end
  end,
})

-- Conform
local conform = require 'conform'
conform.setup {
  formatters_by_ft = {
    lua = { 'stylua' },
    svelte = { 'prettierd' },
    typescript = { 'biome', 'biome-organize-imports', 'prettierd' },
    javascript = { 'biome', 'biome-organize-imports', 'prettierd' },
    typescriptreact = { 'prettierd' },
    javascriptreact = { 'prettierd' },
    css = { 'biome' },
    nix = { 'nixfmt' },
    json = { 'biome' },
  },
}
vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

-- Linter
local lint = require 'lint'
lint.linters_by_ft = {
  typescript = { 'biomejs' },
  javascript = { 'biomejs' },
  json = { 'biomejs' },
  svelte = { 'eslint_d' },
}
vim.keymap.set('n', '<leader>fl', lint.try_lint, { desc = 'Lint current file' })
local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
  group = lint_augroup,
  callback = function()
    if vim.bo.modifiable then
      lint.try_lint()
    end
  end,
})
