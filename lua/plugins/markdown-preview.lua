vim.pack.add({
  {
    src = gh("iamcco/markdown-preview.nvim"),
    build = function() 
      vim.fn["mkdp#util#install"]()
    end,
},
})
