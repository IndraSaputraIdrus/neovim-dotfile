return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    local treesitter = require 'nvim-treesitter'

    treesitter.setup {}
    treesitter.install {
      'javascript',
      'typescript',
      'json',
      'css',
      'html',
      'svelte',
    }

    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('indra.config', { clear = true }),
      callback = function(ev)
        local filetype = ev.match
        local lang = vim.treesitter.language.get_lang(filetype)
        if vim.treesitter.language.add(lang) then
          -- intentation
          if vim.treesitter.query.get(filetype, 'indents') then
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end

          -- -- folds
          -- if vim.treesitter.query.get(filetype, 'folds') then
          --   vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
          -- end

          -- highlighting
          vim.treesitter.start()
        end
      end,
    })
  end,
}
