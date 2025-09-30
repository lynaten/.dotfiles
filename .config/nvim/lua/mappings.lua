require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")


map({ "n", "i", "v" }, "<C-s>", "<cmd>w!<cr>", { desc = "Save file" })
map({ "n", "i", "v" }, "<C-q>", "<cmd>q!<cr>", { desc = "Quit" })

-- Neo-tree toggle
map({ "n", "i" }, "<C-b>", "<cmd>Neotree toggle<cr>", { desc = "Toggle Neo-tree" })

-- Move lines (Alt + j/k)
map("n", "<A-j>", ":m+<CR>==", opts)
map("n", "<A-k>", ":m-2<CR>==", opts)
map("i", "<A-j>", "<Esc>:m+<CR>==gi", opts)
map("i", "<A-k>", "<Esc>:m-2<CR>==gi", opts)
map("v", "<A-j>", ":m'>+<CR>gv=gv", opts)
map("v", "<A-k>", ":m-2<CR>gv=gv", opts)

-- Comment (tpope/vim-commentary)
map({ "n", "i" }, "<C-/>", "<cmd>Commentary<cr>", { desc = "Toggle comment" })
map("v", "<C-/>", ":Commentary<cr>", { desc = "Toggle comment (visual)" })

-- Undo / Redo
map("n", "<C-z>", "u", { desc = "Undo" })
map("n", "<C-y>", "<C-r>", { desc = "Redo" })

map("i", "<C-z>", "<Esc>ui", { desc = "Undo (insert)" })
map("i", "<C-y>", "<Esc><C-r>i", { desc = "Redo (insert)" })


map("v", "<C-z>", "<Esc>u", { desc = "Undo (visual)" })
map("v", "<C-y>", "<Esc><C-r>", { desc = "Redo (visual)" })

-- Clipboard-like behavior
-- Copy
map("v", "<C-c>", "y", { desc = "Copy selection" }) -- Visual mode copy
map("n", "<C-c>", "yy", { desc = "Copy line" })     -- Normal mode copy line

-- Paste
map("i", "<C-v>", "<C-r>+", { desc = "Paste from clipboard" })
map("v", "<C-v>", '"_dP', { desc = "Paste over selection" })
map("n", "<C-v>", "p", { desc = "Paste after cursor" })

-- Cut
map("v", "<C-x>", "d", { desc = "Cut selection" })
map("n", "<C-x>", "dd", { desc = "Cut line" })
map("i", "<C-x>", "<C-o>dd", { desc = "Cut line" })


-- Move cursor by word (Ctrl+left/right)
map("n", "<C-right>", "e", opts)
map("n", "<C-left>", "b", opts)

-- Terminal toggle
map("i", "<C-j>", "<Esc>:ToggleTerm direction=horizontal<cr>", { desc = "Toggle terminal" })

-- Markdown Preview
map("n", "<leader>mp", "<cmd>MarkdownPreview<cr>", { desc = "Markdown Preview" })

-- Multi-cursor (vim-visual-multi defaults + VSCode-like)
vim.g.VM_maps = {
  ["Find Under"] = "<C-d>",
  ["Add Cursor Down"] = "<C-A-Down>",
  ["Add Cursor Up"] = "<C-A-Up>",
}

map("v", "<C-f>", "y/<C-r>=escape(@\",'/')<CR><CR>", { desc = "Search for visual selection" })

-- Normal mode: open search (/)
map("n", "<C-f>", "/", { desc = "Search forward" })
--
-- -- Insert mode: leave insert, start search
map("i", "<C-f>", "<Esc>/", { desc = "Search forward" })

--   Tab, shift tab
--   save go back to normal mode
--   undo and redo can in insert mode
--   find all buffering 
--   open another file
--  when backspace in visual, remove it


-- In visual mode: indent / unindent and keep selection
map("v", "<Tab>", ">gv", { desc = "Indent selection" })
map("v", "<S-Tab>", "<gv", { desc = "Unindent selection" })
-- In insert mode: Tab inserts a tab/space, Shift-Tab unindents current line
map("i", "<Tab>", "<Tab>", { desc = "Insert Tab" })
map("i", "<S-Tab>", "<C-d>", { desc = "Unindent line" })

map("v", "<BS>", '"_d', { desc = "Delete selection with Backspace" })


-- Telescope find buffers (Ctrl + Shift + F)

vim.keymap.set("n", "<C-S-f>", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep" })
-- -- Telescope find files (Ctrl + O)
map("n", "<C-p>", "<cmd>Telescope find_files<cr>", { desc = "Find files" })

-- Markdown preview toggle

vim.keymap.set("n", "<C-S-v>", "<cmd>MarkdownPreviewToggle<cr>", { desc = "preview markdown" })
