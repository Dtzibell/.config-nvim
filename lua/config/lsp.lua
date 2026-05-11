vim.treesitter.language.register("xml", "fxml")
vim.filetype.add({
  extension = {fxml = "fxml", racket = ".rkt"},
})

vim.lsp.config["lemminx"] = {
  filetypes = {"xml", "xsd", "xsl", "xslt", "svg", "fxml" },
}

vim.lsp.config["luals"] = {
  cmd = { 'lua-language-server' },
  filetypes = { "lua" },
}

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

vim.lsp.config["racket-langserver"] = { 
  cmd = { "racket", "--lib", "racket-langserver" },
  filetypes = { "racket", "scheme" },
  root_markers = {".git" },
}

vim.lsp.config["rust-analyzer"] = {
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
  }

vim.lsp.config["ty"] = {
  settings = {
    ty = {
    },
  },
}

vim.lsp.enable({
  "lemminx",
  "luals",
  "jdtls",
  "texlab",
  "ty",
  "racket-langserver",
  "rust-analyzer",
})
