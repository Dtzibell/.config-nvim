
return {
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
