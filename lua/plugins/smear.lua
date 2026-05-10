
vim.pack.add({
  { src = gh("sphamba/smear-cursor.nvim")},
})

require("smear_cursor").setup({
    opts = {
        smear_between_buffers = true,
        smear_between_neighbor_lines = true,
        smear_insert_mode = true,
        stiffness = 0.5,
        trailing_stiffness = 0.3,
        enabled = true,
    },
})
