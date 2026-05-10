
vim.pack.add({
  { src = gh("zaldih/themery.nvim")},
})

require("themery").setup({
  themes = {
    "synthweave",
    "desert",
    "void",
  },
  livePreview=true,
})
