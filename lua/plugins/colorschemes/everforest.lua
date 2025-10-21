return {
	"sainnhe/everforest",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
		-- load the colorscheme here
        -- local fm = require("everforest")
        -- fm.setup {
        --     glow = true,
        --     theme = "fluoromachine",
        --     transparent = true,
        -- }
	    vim.g.everforest_enable_italic = true
        vim.g.everforest_background = "soft"
        vim.cmd("colorscheme everforest")
    end,
}
