vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown" },
  nested = true,
  callback = function()
    vim.opt.spelllang = "en,de"
    vim.o.spellcapcheck = ""
    vim.o.background = "light"
    vim.cmd.colorscheme("solarized")
    vim.opt.spellfile = vim.fn.expand("~/.local/share/nvim/site/spell/en.utf-8.add") .. 
    "," .. vim.fn.expand("~/.local/share/nvim/site/spell/de.utf-8.add")
    vim.api.nvim_create_user_command("MdLink", function() 
      vim.cmd('normal! vi("+y') 
      local link = vim.fn.getreg('+')
      vim.fn.jobstart( { 'xdg-open', link }, { detach = true } )
    end, {})
  end
})

-- thats a bandaid solution for spelling, should be rethought.
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function(args)
    local ext = vim.fn.fnamemodify(args.file, ":e")
    if ext ~= "md" and ext ~= "tex" then
      vim.o.wrap = false
      vim.o.spell = false
      vim.o.colorcolumn = "80"
    else
      vim.o.wrap = true
      vim.o.spell = true
      vim.o.colorcolumn = ""
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    require("todo-comments").setup({
      highlight = {
        comments_only = false,
      },
    })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "tex",
  callback = function()
    vim.bo.formatprg = "latexindent.pl"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = function()
    vim.bo.formatprg = "rustfmt --emit stdout"
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function() 
    vim.hl.on_yank({higroup="Visual", timeout=200})
  end,
})
