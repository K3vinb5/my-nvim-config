require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")

-- My mappings
map("n", "<leader>mv", "<cmd>Maven<cr>", {desc = "Open Maven config"})
map("n", "a", "i")
map("n", "<leader>sr", "<cmd>Telescope lsp_references<cr>", {desc = "Search references"})
map("n", "<leader>so", "<cmd>Telescope lsp_definitions<cr>", {desc = "Search definition (origin)"})



-- Temp mappings
-- map("n","<S-Up>","v<Up>")
-- map("n","<S-Down>","v<Down>")
-- map("n","<S-Right>","v<Right>")
-- map("n","<S-Left>","v<Left>")
--
-- map("v","<S-Up>","<Up>")
-- map("v","<S-Down>","<Down>")
-- map("v","<S-Left>","<Left>")
-- map("v","<S-Right>","<Right>")
--
-- map("i", "<S-Up>", "<Esc>v<Up>")
-- map("i", "<S-Down>", "<Esc>v<Down>")
-- map("i", "<S-Left>", "<Esc>v<Left>")
-- map("i", "<S-Right>", "<Esc>v<Right>")
-- map("v", "<C-c>", "y<Esc>i")
-- map("v", "<C-x>", "d<Esc>i")
-- map("n", "<C-v>", "pi")
-- map("i", "<C-v>", "<Esc>pi")
-- map("i", "<C-z>", "<Esc>ui")
