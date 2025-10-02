return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
  --
  { "mg979/vim-visual-multi" },
  { "m-pilia/vim-smarthome" },
  { "tpope/vim-sleuth" },
  { "tpope/vim-commentary", lazy = false },

  -- Aesthetic / fun
  { "fcpg/vim-orbital" },
  { "romainl/vim-malotru" },

  -- Markdown
  {
    "iamcco/markdown-preview.nvim",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  -- UI Extras
  {
    "petertriho/nvim-scrollbar",
    config = function()
      require("scrollbar").setup()
    end,
  },

  -- File Explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    lazy = false,
  },
  {
    "3rd/image.nvim",
    dependencies = {
      "luarocks/luarocks",
    }
  },

  -- Markdown
  {
    "iamcco/markdown-preview.nvim",
    build = function()
        vim.fn["mkdp#util#install"]()
    end,
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup {
        ensure_installed = { "clangd" },
        handlers = {
          function(server)
            if server == "clangd" then
              vim.lsp.config("clangd", {
                cmd = { "clangd", "--background-index", "--clang-tidy" },
                init_options = {
                  fallbackFlags = { "-std=c++17" },
                },
                on_attach = function(_, bufnr)
                  local opts = { noremap = true, silent = true, buffer = bufnr }
                  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                  vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end, opts)
                  vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, opts)
                  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                end,
              })
            else
              vim.lsp.config(server, {})
            end
          end,
        },
      }
    end,
  }

 }
