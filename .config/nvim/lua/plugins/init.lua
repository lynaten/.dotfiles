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
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
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
  -- https://github.com/nvim-tree/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt#L1360
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    config = function()
      require("nvim-tree").setup {
        view = {
          side = "left",
        },
        filters = {
          dotfiles = false, -- show hidden files (set to true to hide)
          git_ignored = false,
        },
      }
    end,
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
    "meatballs/notebook.nvim",
    ft = "ipynb",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("notebook").setup {
        insert_blank_line = true,
        show_index = true,
        show_cell_type = true,
        virtual_text_style = { fg = "lightblue", italic = true },
      }
    end,
  },
  {
    "meatballs/magma-nvim",
    build = ":UpdateRemotePlugins",
    config = function()
      vim.g.magma_automatically_open_output = true
    end,
  },
  {
    "Maduki-tech/nvim-plantuml",
    ft = { "puml", "plantuml" }, -- load only for puml files
    config = function()
      require("plantuml").setup {
        output_dir = "/tmp",
        viewer = "xdg-open", -- IMPORTANT for Linux (not 'open')
        auto_refresh = true,
      }
    end,
  },
  {
    "3rd/image.nvim",
    build = false,
    config = function()
      require("image").setup {
        backend = "kitty", -- or "ueberzug" or "sixel"
        processor = "magick_cli", -- or "magick_rock"
        integrations = {
          markdown = {
            enabled = true,
            clear_in_insert_mode = false,
            download_remote_images = true,
            only_render_image_at_cursor = false,
            only_render_image_at_cursor_mode = "popup", -- or "inline"
            floating_windows = false,
            filetypes = { "markdown", "vimwiki" },
          },
          asciidoc = {
            enabled = true,
            clear_in_insert_mode = false,
            download_remote_images = true,
            only_render_image_at_cursor = false,
            only_render_image_at_cursor_mode = "popup",
            floating_windows = false,
            filetypes = { "asciidoc", "adoc" },
          },
          neorg = {
            enabled = true,
            filetypes = { "norg" },
          },
          rst = {
            enabled = true,
          },
          typst = {
            enabled = true,
            filetypes = { "typst" },
          },
          html = {
            enabled = false,
          },
          css = {
            enabled = false,
          },
        },
        max_width = nil,
        max_height = nil,
        max_width_window_percentage = nil,
        max_height_window_percentage = 50,
        scale_factor = 1.0,
        window_overlap_clear_enabled = false,
        window_overlap_clear_ft_ignore = {
          "cmp_menu",
          "cmp_docs",
          "snacks_notif",
          "scrollview",
          "scrollview_sign",
        },
        editor_only_render_when_focused = false,
        tmux_show_only_in_active_window = false,
        hijack_file_patterns = nil,
      }
    end,
  },
}
