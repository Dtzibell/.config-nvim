local map = vim.keymap.set

map("n", "<leader><CR>", "<Cmd>nohlsearch<CR>", {desc = "Clears search highlights."}) 
map("n", "<leader>so", function()

  for name, _ in pairs(package.loaded) do
    if name:match("^config") or name:match("^plugins") or name:match("^snippets")then
      package.loaded[name] = nil
    end
  end
  vim.cmd("so " .. vim.fn.expand("~/.config/nvim/init.lua"))
  vim.notify("Config reloaded!", vim.log.levels.INFO)
end, {desc = "Sources the config file"})
map("n", "<Leader>ot", "<cmd>vsplit term://zsh<CR>",  {desc = "Places a terminal window in a vertical split"}) 
map("t", "<Esc>", "<C-\\><C-n>", {desc = "Allows using escape to exit insert mode in the terminal"}) 

local function split_and_jump()
  local word = vim.fn.expand("<cword>")
  local tags = vim.fn.taglist("^" .. word .. "$")
  if #tags == 0 then
    -- catches cases where there are no tags for word
    vim.notify("No tags found for: " .. word, vim.log.levels.WARN)
    return
  end
  vim.cmd("vsplit | tjump ".. word)
end
map("n", "gd", split_and_jump, {
  desc = "vertically splits the window and jumps to the ctag of the word under the cursor",
})

map("n", "<leader>ft", "mzgggqG`z", { buffer = true, desc = "Formats a buffer with 'gq'. Either formatexpr or formatprg is used"})

map("n", "<leader>tr", "<Cmd>NvimTreeOpen<CR>", { desc = "Opens NvimTree" })
