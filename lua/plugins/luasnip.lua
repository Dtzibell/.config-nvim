vim.pack.add({
  { src = gh("L3MON4D3/LuaSnip"), version = vim.version.range("v2.*")},
})

local ls = require("luasnip")
vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-E>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, {silent = true})

vim.api.nvim_set_keymap("i", "<C-n>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("s", "<C-n>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("i", "<C-p>", "<Plug>luasnip-prev-choice", {})
vim.api.nvim_set_keymap("s", "<C-p>", "<Plug>luasnip-prev-choice", {})

ls.setup{
  keep_roots = true,
  link_children = true,
  link_roots = true,
  exit_roots = true,

  update_events = "TextChanged, TextChangedI",
  enable_autosnippets = true,
  history = true,
}
require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/lua/snippets"})
