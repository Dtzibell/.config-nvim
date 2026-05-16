vim.pack.add({
  { src = gh("maxmx03/solarized.nvim") }
})

-- Disables strikethrough text if SpellBad
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "solarized",
  callback = function()
    vim.api.nvim_set_hl(0, "SpellBad",   { underline = true, sp = "#989D49" })
    vim.api.nvim_set_hl(0, "SpellCap",   { undercurl = true, sp = "#268bd2" })
    vim.api.nvim_set_hl(0, "SpellRare",  { undercurl = true, sp = "#2aa198" })
    vim.api.nvim_set_hl(0, "SpellLocal", { undercurl = true, sp = "#859900" })
  end,
})
