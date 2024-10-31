return {
  bashls = {
    filetypes = { "sh", "bash" },
    settings = {
      bashIde = {
        globPattern = "**/*@(.sh|.inc|.bash|.command)",
        explainShell = {
          enable = true,
        },
        shellcheck = {
          enable = true,
          exclude = {"SC2154"}, -- example of disable shellcheck rules
        },
      },
    },
    single_file_support = true,
  },
}
