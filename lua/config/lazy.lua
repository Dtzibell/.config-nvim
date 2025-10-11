-- Bootstrap lazy.nvim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)

local buffer_ft = vim.fn.expand("%:e")

vim.g.mapleader = ";"
vim.g.leader = ";"
vim.g.maplocalleader = "\\"
vim.keymap.set("n", "<leader>px", vim.cmd.Ex) -- opens netrw

-- option set up
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

if buffer_ft ~= ".md" then
  vim.opt.wrap = true
else
  vim.opt.wrap = false
  vim.opt.colorcolumn = "80"
end

vim.opt.incsearch = true
vim.opt.termguicolors = true

vim.opt.signcolumn = "yes"
vim.opt.updatetime = 100

vim.opt.clipboard = unnamedplus -- initializes clipboard
vim.opt.cmdheight = 3 -- cmdline height
vim.api.nvim_command("set confirm") -- confirm on close
vim.api.nvim_command("set cursorline") -- highlight cursor line
vim.opt.cursorlineopt = "both"
vim.opt.gdefault = true -- all matches in a line are substituted by default
-- vim.opt.guicursor = ""
vim.opt.ignorecase = true -- ignore case on search by default
vim.opt.inccommand = split -- opens partial results of replacement in a preview window
vim.opt.mouse = nvic
vim.opt.number = true
vim.opt.rnu = true

vim.opt.scrolloff = 5
vim.opt.splitright = true -- where to split the buffers
vim.opt.virtualedit = onemore -- should allow the cursor to move one character beyond the end of the line, but does not
vim.opt.visualbell = true
-- 
-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{ import = "plugins" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "desert" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})

-- telescope keybinds
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

require('nvim-treesitter.configs').setup {
  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  ensure_installed = { "lua", "vim", "vimdoc", "markdown", "markdown_inline", "python", "java", "bash", "xml"},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,

 },
}
vim.treesitter.language.register("xml", "fxml")
vim.lsp.enable("pyright")


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


local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key

ls.setup{
  keep_roots = true,
  link_children = true,
  link_roots = true,

  update_events = "TextChanged, TextChangedI",
  enable_autosnippets = true,
  history = true,
}

require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/lua/snippets"})
vim.filetype.add({
  extension = {fxml = "fxml",},
})
vim.lsp.config["lemminx"] = {
  filetypes = {"xml", "xsd", "xsl", "xslt", "svg", "fxml" },
}
vim.lsp.enable("lemminx")
vim.lsp.config["luals"] = {
  cmd = { 'lua-language-server' },
  filetypes = { "lua" },
}
vim.lsp.enable("luals")
vim.lsp.config["jdtls"] = {
  settings = {
    java = {
      configuration = {
        runtimes = {
          {
            name = "JavaSE-25",
            path = "/home/dtzi/Documents/jdk-25/"
          },
          {
            name = "JavaSE-21",
            path = "/home/dtzi/Documents/jdk-21/"
          },
        },
      },
    },
  },
}
vim.lsp.enable("jdtls")

vim.g.mkdp_auto_start = 1

vim.keymap.set("n", "gd", "<cmd> lua vim.lsp.buf.definition() <CR>") 
vim.keymap.set("n", "gD", "<cmd> lua vim.lsp.buf.declaration() <CR>")
