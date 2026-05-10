
vim.pack.add({
  { src = gh("nvim-treesitter/nvim-treesitter"), version = "main" },
})
require("nvim-treesitter").install({
  {"rust", "java", "python", "lua", "latex"},
})
