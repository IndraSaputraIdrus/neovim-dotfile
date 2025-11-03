-- Treesitter
MiniDeps.later(function()
  MiniDeps.add {
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
