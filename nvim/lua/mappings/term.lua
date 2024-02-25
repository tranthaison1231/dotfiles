local map = vim.keymap.set

map("n", "<leader>t", "<cmd>ToggleTerm<cr>", { desc = "Toggle Terminal" })
map("t", "<esc>", [[<C-\><C-n>]], { desc = "Exit Terminal" })
