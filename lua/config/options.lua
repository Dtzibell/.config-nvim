local opt = vim.opt

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

opt.smartindent = true

opt.wrap = false 
opt.colorcolumn = "80"

opt.incsearch = true
opt.termguicolors = true

opt.signcolumn = "yes"
opt.updatetime = 100

opt.clipboard = unnamedplus -- initializes clipboard
opt.cmdheight = 3 -- cmdline height
opt.cursorline = true
vim.api.nvim_command("set confirm") -- confirm on close
opt.cursorlineopt = "both"
opt.gdefault = true -- all matches in a line are substituted by default
opt.ignorecase = true -- ignore case on search by default
opt.inccommand = "split" -- opens partial results of replacement in a preview window
opt.mouse = "nvic"
opt.number = true
opt.rnu = true

opt.scrolloff = 5
opt.splitright = true -- where to split the buffers
opt.virtualedit = onemore -- should allow the cursor to move one character beyond the end of the line, but does not
opt.visualbell = true

opt.backup = false

opt.foldcolumn = "3"
opt.foldopen = "all"
opt.foldclose = "all"
opt.foldmethod = "expr"
opt.foldlevel = 1
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

vim.treesitter.language.register("xml", "fxml")
vim.filetype.add({
  extension = {fxml = "fxml", racket = "rkt"},
})
