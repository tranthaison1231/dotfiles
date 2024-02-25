local map = vim.keymap.set

map("n", "<leader>ha", function()
  require("harpoon.mark").add_file()
end, { noremap = true, silent = true, desc = "Add file to harpoon" })

map("n", "<leader>hm", function()
  require("harpoon.ui").toggle_quick_menu()
end, { noremap = true, silent = true, desc = "Toggle Harpoon Menu" })
