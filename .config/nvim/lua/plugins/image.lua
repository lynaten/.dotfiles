
return {
  "3rd/image.nvim",
  opts = {
    backend = "kitty",
    processor = "magick_cli",
    max_width_window_percentage  = 100,
    max_height_window_percentage = 100,
    scale_factor = 1.0,
  },
  config = function(_, opts)
    local image = require("image")
    image.setup(opts)
    image.enable()

    -- === Zoom keymaps ===
    local scale = 1.0
    local function set_scale(factor)
      scale = factor
      image.setup({ scale_factor = scale })
      image.disable()
      image.enable()
    end

    vim.keymap.set("n", "<C-=>", function() set_scale(scale * 1.25) end, { desc = "Zoom image in" })
    vim.keymap.set("n", "<C-->", function() set_scale(scale * 0.8)  end, { desc = "Zoom image out" })
    vim.keymap.set("n", "<C-r>", function() set_scale(1.0)          end, { desc = "Reset image zoom" })
  end,
}
