vim.lsp.config("pyright", {
  settings = {
    python = {
      analysis = {
        autoImportCompletions = true,
        typeCheckingMode = "basic", -- "off" | "basic" | "strict"
      },
    },
  },
})

