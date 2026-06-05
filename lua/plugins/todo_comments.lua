
vim.pack.add({
  { src = gh("folke/todo-comments.nvim")},
})

vim.keymap.set("n", "<leader>ftd", "<Cmd>TodoTelescope<CR>", { desc = "Opens Todo telescope" })
