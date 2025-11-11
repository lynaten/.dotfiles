-- Load NvChad defaults
require("nvchad.configs.lspconfig").defaults()

-- Define servers you want to enable
local servers = {
  "html",
  "cssls",
  "jdtls",     -- Java
  "gradle_ls", -- Gradle build files
  "lemminx",   -- XML
  "yamlls",    -- YAML
}

vim.lsp.enable(servers)

-- Optional: extra configuration for jdtls (Java)
-- because it benefits from workspace-specific setup
local lspconfig = require("lspconfig")

lspconfig.jdtls.setup({
  cmd = { "jdtls" },
  root_dir = lspconfig.util.root_pattern("pom.xml", "build.gradle", ".git"),
  on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  end,
  settings = {
    java = {
      format = { enabled = false }, -- handled by null-ls (google-java-format)
      signatureHelp = { enabled = true },
      contentProvider = { preferred = "fernflower" },
    },
  },
})


-- read :h vim.lsp.config for changing options of lsp servers 
