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
  root_markers = {"pom.xml"},
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

-- vim.lsp.config["racket-langserver"] = { 
--   cmd = { "racket", "--lib", "racket-langserver" },
--   filetypes = { "racket", "scheme" },
--   root_markers = {".git" },
-- }
-- vim.lsp.enable("racket-langserver")

-- vim.lsp.config["rust-analyzer"] = {
--     cmd = { "rust-analyzer" },
--     filetypes = { "rust" },
--   }
-- vim.lsp.enable("rust-analyzer")

vim.lsp.config["ty"] = {
  settings = {
    ty = {
    },
  },
}
vim.lsp.enable("ty")

vim.lsp.enable("texlab")
