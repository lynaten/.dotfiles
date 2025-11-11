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

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
       "html", "css"
  		},
  	},
  },
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

  -- -- -- File Explorer

  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    config = function()
      require("nvim-tree").setup({
        view = {
          adaptive_size = true,
          side = "left",
        },
        renderer = {
          group_empty = true, -- compact "folder1/folder2/folder3"
        },
        filters = {
          dotfiles = false,   -- show hidden files (set to true to hide)
        },
        actions = {
          open_file = {
            quit_on_open = false,
          },
        },
        update_focused_file = {
          enable = true,
          update_root = false, -- set to true if you want cwd to follow too
          ignore_list = {},
        },
      })

      -- Keymap to toggle the tree
    end,
  },

  -- {
  --   "nvim-neo-tree/neo-tree.nvim",
  --   enabled = false,
  -- },
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
  },


{
  "nvimtools/none-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- 🐍 Python
        null_ls.builtins.formatting.black,
        null_ls.builtins.diagnostics.flake8,

        -- 🌐 Web stack
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.formatting.phpcsfixer,
        null_ls.builtins.diagnostics.phpcs,
        null_ls.builtins.diagnostics.stylelint,

        -- ☕ Java
        null_ls.builtins.formatting.google_java_format, -- Mason provides this via google-java-format
      },
    })

    -- 🔧 Format on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = {
        "*.py",
        "*.java", -- added Java
      },
      callback = function()
        vim.lsp.buf.format({ async = false })
      end,
    })
  end,
},


 }
