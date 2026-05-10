vim.pack.add({
  { src = gh("lervag/vimtex")},
})

vim.g.vimtex_view_general_viewer = "okular"
vim.g.vimtex_view_general_options = "--unique file:@pdf\\#src:@line@tex"
vim.g.vimtex_compiler_method = 'latexmk' -- should be set by default though
vim.g.vimtex_compiler_latexmk_engines = {
  _ = '-lualatex',
}
