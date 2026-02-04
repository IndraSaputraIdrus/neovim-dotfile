return {
  {
    'mason-org/mason.nvim',
    event = 'VeryLazy',
    opts = {},
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    cmd = {
      'MasonToolsInstall',
      'MasonToolsInstallSync',
      'MasonToolsUpdate',
      'MasonToolsUpdateSync',
      'MasonToolsClean',
    },
    opts = {
      ensure_installed = {
        'lua-language-server',
        'tree-sitter-cli',
        'typescript-language-server',
        'svelte-language-server',
        'stylua',
        'gopls',
        'biome',
      },
    },
  },
}
