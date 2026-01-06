vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

vim.diagnostic.config({
  virtual_text = true,      -- texto do erro na linha
  signs = true,             -- ícones na lateral
  underline = true,         -- sublinhado no erro
  update_in_insert = false, -- não atualizar enquanto digita
  severity_sort = true,     -- erros mais graves primeiro
})

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

