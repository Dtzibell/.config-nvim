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

function wrap(buffer_ft)
  wrapped_files = {"md", "tex"}
  for i, ft in ipairs(wrapped_files) do 
    if buffer_ft == ft then
      vim.opt.wrap = true
      return
    end
  end
  vim.opt.wrap = false
  vim.opt.colorcolumn = "80"
  return
end

wrap(buffer_ft)

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
vim.opt.winblend = 29

vim.opt.backup = false

-- doesnt work very well, some locations are not made transparent
local function make_transparent()
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })

  vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
  vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "none" })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "none" })

  vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })
  vim.api.nvim_set_hl(0, "TabLine", { bg = "none" })
  vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none" })

  vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "none" })
end
-- make_transparent()
-- vim.api.nvim_create_autocmd("ColorScheme", {
--   pattern = "*",
--   callback = make_transparent
-- })

vim.keymap.set("n", "<Leader>ot", "<cmd>vsplit term://zsh<CR>")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- 
-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
    { import = "plugins/colorschemes" },
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
  ensure_installed = { "lua", "vim", "vimdoc", "markdown", "markdown_inline", "python", "java", "bash", "xml", "latex"},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gis",
      node_incremental = "gni",
      scope_incremental = "gsi",
      node_decremental = "gnd",
    },
  },
  -- There is already a vim builtin indent with "=", but the TS indent is
  -- supposed to be a bit more accurate because it has the AST.
  indent = {
    enable = true,
  },
}

-- could potentially be useful if I ever play around with the treesitter
-- local ts_utils = require "nvim-treesitter.ts_utils"
--
-- vim.keymap.set('n', 'tsn', function() 
--   local node = ts_utils.get_node_at_cursor(nil)
--   print(node:type())
-- end)

require("themery").setup({
  themes = {
    "everforest", 
    "gruvbox",
    "cyberdream",
    "silkcircuit",
    "synthweave",
    "desert"},
  livePreview=true,
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

vim.treesitter.language.register("xml", "fxml")
vim.filetype.add({
  extension = {fxml = "fxml", racket = ".rkt"},
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
  cmd = {"jdtls"},
  settings = {
    java = {
      configuration = {
        runtimes = {
          {
            name = "JavaSE-25",
            path = "~/.local/share/jdk-25.0.2"
          },
        },
      },
    },
  },
}
vim.lsp.enable("jdtls")

vim.lsp.config["racket-langserver"] = { 
  cmd = { "racket", "--lib", "racket-langserver" },
  filetypes = { "racket", "scheme" },
  root_markers = {".git" },
}
vim.lsp.enable("racket-langserver")

-- vim.lsp.config["rust-analyzer"] = {
--     cmd = { "rust-analyzer" },
--     filetypes = { "rust" },
--   }
-- vim.lsp.enable("rust-analyzer")

vim.lsp.config["pyright"] = {
  settings = {
    python = {
      pythonPath = ".venv/bin/python"
    }
  }
}
vim.lsp.enable("pyright")

vim.lsp.enable("texlab")

vim.g.mkdp_auto_start = 1 -- autostarts markdown preview

local function split_and_jump()
  local word = vim.fn.expand("<cword>")
  local tags = vim.fn.taglist("^" .. word .. "$")
  if #tags == 0 then
    vim.notify("No tags found for: " .. word, vim.log.levels.WARN)
    return
  end
  vim.cmd("vsplit | tjump ".. word)
end
vim.keymap.set("n", "gd", split_and_jump)

vim.g.vimtex_compiler_method = 'latexmk' -- should be set by default though
vim.g.vimtex_compiler_latexmk_engines = {
  _ = '-lualatex',
}

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function() 
    vim.hl.on_yank({higroup="Visual", timeout=200})
  end,
})


-- formatting of tex files with latexindent.pl
vim.api.nvim_create_autocmd("FileType", {
  pattern = "tex",
  callback = function()
    vim.opt_local.formatprg = "latexindent.pl"
    -- mz marks current cursor pos, `z goes to that pos
    vim.keymap.set("n", "<leader>ft", "mzgggqG`z", { buffer = true })
  end,
})
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
      refresh_time = 50, -- ~60fps
      events = {
        'WinEnter',
        'BufEnter',
        'BufWritePost',
        'SessionLoadPost',
        'FileChangedShellPost',
        'VimResized',
        'Filetype',
        'CursorMoved',
        'CursorMovedI',
        'ModeChanged',
      },
    }
  },
  sections = {
    lualine_a = {'mode', 'searchcount'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
