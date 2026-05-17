require("config.options")
require('vim._core.ui2').enable({})

gh = function(x) return "https://www.github.com/" .. x end
require("plugins")
require("config.keymaps")
require("config.autocmds")
require("config.lsp")

-- vim.cmd("colorscheme synthweave")

