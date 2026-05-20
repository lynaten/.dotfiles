local servers = {
  html = {},
  awk_ls = {},
  bashls = {},

  -- TypeScript (REQUIRED by vue_ls)
  ts_ls = {
    filetypes = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
    },
  },

  -- Vue Language Server (modern Volar replacement)
  vue_ls = {
    filetypes = {
      "vue",
    },
  },

  pyright = {
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          typeCheckingMode = "basic",
        },
      },
    },
  },
}

for name, opts in pairs(servers) do
  vim.lsp.config(name, opts)
  vim.lsp.enable(name)
end

-- if you dont want to call the enable method in the loop, just pass a table.
-- vim.lsp.enable(vim.tbl_keys(servers))
-- vim.lsp.enable({"pyright", "clangd"})
