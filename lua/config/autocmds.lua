vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown" },
  callback = function()
    vim.opt.spelllang = "en,de"
    vim.o.spellcapcheck = ""
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
vim.api.nvim_create_autocmd("BufLeave", {
  pattern = "*.md",
  callback = function()
    vim.o.wrap = false
    vim.o.spell = false
    vim.o.colorcolumn = "80"
  end,
})
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.md",
  callback = function()
    vim.o.wrap = true
    vim.o.spell = true
    vim.o.colorcolumn = "0"
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
    vim.o.wrap = true
    vim.o.spell = true
    vim.o.spellcapcheck = ""
    vim.o.colorcolumn = "0"
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
