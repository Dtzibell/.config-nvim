
vim.pack.add({
  { src = gh("zaldih/themery.nvim")},
})

require("themery").setup({
  themes = {
    "synthweave",
    "desert",
    "void",
    { name = "Solarized Light", colorscheme = "solarized", before = [[
    vim.o.background="light"
    ]],
  },
},
livePreview=true,
})
