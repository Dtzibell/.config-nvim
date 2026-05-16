require("config.keymaps")
require("config.options")
require("config.autocmds")
require("config.lsp")
require('vim._core.ui2').enable({})

gh = function(x) return "https://www.github.com/" .. x end
-- require("plugins")

vim.cmd("colorscheme synthweave")

