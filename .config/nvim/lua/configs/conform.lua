local options = {
  formatters_by_ft = {
    -- Lua
    lua = { "stylua" },

    -- Web / Vue / Inertia
    javascript = { "prettierd" },
    typescript = { "prettierd" },
    javascriptreact = { "prettierd" },
    typescriptreact = { "prettierd" },
    vue = { "prettierd" },
    css = { "prettierd" },
    html = { "prettierd" },
    json = { "prettierd" },
    yaml = { "prettierd" },

    -- PHP (Laravel)
    php = { "php-cs-fixer" },

    -- Rust
    rust = { "rustfmt" },

    -- Python (optional, since installed)
    python = { "black" },
  },

  -- Recommended: keep this OFF initially on slow hardware
  -- Enable later if you want
  -- format_on_save = {
  --   timeout_ms = 800,
  --   lsp_fallback = true,
  -- },
}

return options

