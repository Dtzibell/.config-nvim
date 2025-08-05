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
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.keymap.set("n", "<leader>px", vim.cmd.Ex) -- opens netrw

-- option set up
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.incsearch = true
vim.opt.termguicolors = true

vim.opt.signcolumn = "yes"
vim.opt.updatetime = 100
vim.opt.colorcolumn = "80"

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
  ensure_installed = { "lua", "vim", "vimdoc", "markdown", "markdown_inline", "python", "java", "bash"},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,

 },
}
vim.lsp.enable("pyright")
