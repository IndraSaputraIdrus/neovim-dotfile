local map = vim.keymap.set

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- exit from insert mode
map("i", "jk", "<esc>", { desc = "exic insert mode", silent = true })

-- Buffer
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })

-- Mini plugins keymap

-- Mini files
map("n", "-", "<cmd>lua MiniFiles.open()<cr>", { desc = "Open file tree"} )

-- Mini picker
map('n', '<leader>ff', '<CMD>:Pick files<CR>', { desc = 'Open file picker' })
map('n', 'grr', '<CMD>lua MiniExtra.pickers.lsp({ scope = "references" })<CR>', { desc = 'LSP buf refenrences' })
map('n', 'grD', '<CMD>lua MiniExtra.pickers.diagnostic()<CR>', { desc = 'LSP buf diagnostic' })
map('n', 'grq', '<CMD>lua MiniExtra.pickers.list({ scope = "quickfix" })<CR>', { desc = 'LSP buf quickfix' })
