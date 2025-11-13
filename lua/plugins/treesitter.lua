return {
  'nvim-treesitter/nvim-treesitter',
  version = false,
  lazy = false,
  branch = 'main',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').install({
      'javascript',
      'typescript',
      'html',
      'css',
      'svelte',
      'javascriptreact',
      'typescriptreact',
      'json',
      'go',
    })

    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('Treesitter', { clear = true }),
      callback = function(ev)
        local filetype = ev.match
        local lang = vim.treesitter.language.get_lang(filetype)
        if vim.treesitter.language.add(lang) then
          -- intentation
          if vim.treesitter.query.get(filetype, 'indents') then
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end

          -- highlighting
          vim.treesitter.start()
        end
      end,
    })
  end,
}
