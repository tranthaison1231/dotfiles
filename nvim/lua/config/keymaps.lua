local map = vim.keymap.set

map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })
map({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without copy" })
map("n", "<leader>l", "<cmd>noh<CR>", { desc = "Clear highlights" })
-- Disable arrow keys
map("n", "<Up>", "<NOP>")
map("n", "<Down>", "<NOP>")
map("n", "<Left>", "<NOP>")
map("n", "<Right>", "<NOP>")

-- Rewrite ControlKeys
map("n", "+", "<C-a>")
map("n", "-", "<C-x>")

-- Select all
map("n", "<C-a>", "gg<S-v>G")

-- Cut
map("n", "<C-x>", "dd", { desc = "Cut" })

map("n", "<C-d>", "<C-d>zz", { desc = "Keeps cursor centered when down a paje" })
map("n", "<C-u>", "<C-u>zz", { desc = "Keeps cursor centered when up a page" })

-- Save file

map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save current file" })
map({ "i", "x", "n", "s" }, "<C-S>", "<cmd>wa<cr><esc>", { desc = "Save all file" })

-- Copy
map("n", "<C-c>", "yy", { desc = "Copy" })
map("v", "<C-c>", "y")
map("n", "<C-v>", "p")

-- Move code
map("v", "<M-j>", "<cmd>m '>+1<CR>gv=gv<CR>")
map("v", "<M-k>", "<cmd>m '<-2<CR>gv=gv<CR>")

-- Google Search
local searching_google_in_normal =
  [[:lua vim.fn.system({'open', 'https://google.com/search?q=' .. vim.fn.expand("<cword>")})<CR>]]
local searching_google_in_visual =
  [[<ESC>gv"gy<ESC>:lua vim.fn.system({'open', 'https://google.com/search?q=' .. vim.fn.getreg('g')})<CR>]]

map("n", "<C-g>", searching_google_in_normal, { silent = true, noremap = true })
map("v", "<C-g>", searching_google_in_visual, { silent = true, noremap = true })

-- Open folder on current buffer
local open_folder = [[:lua vim.fn.system({ 'open', vim.fn.expand("<cfile")})<CR>]]

map("n", "<leader>o", open_folder, { silent = true, noremap = true, desc = "Open folder" })

-- Close buffer
map("i", "jj", "<ESC>", { silent = true })

-- Resize window
map("n", "<M-Left>", ":vertical resize +5<CR>")
map("n", "<M-Right>", ":vertical resize -5<CR>")
map("n", "<M-Up>", ":resize +5<CR>")
map("n", "<M-Down>", ":resize -5<CR>")

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Trouble
map("n", "<leader>xx", function()
  require("trouble").toggle()
end, { desc = "Trouble" })

-- Toggle Terms
map("t", "<esc>", [[<C-\><C-n>]], { desc = "Exit Terminal" })
map("n", "<leader>tt", function()
  vim.cmd("ToggleTerm")
end)

-- Diagnostic
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

-- Rename
map("n", "<leader>cr", "<Cmd>Lspsaga rename<cr>", { desc = "Rename" })

-- Mason
map("n", "<leader>cm", "<Cmd>Mason<cr>", { desc = "Mason" })

-- Copy file paths
map("n", "<leader>cp", '<Cmd>let @+ = expand("%")<cr>', { desc = "Copy File Name" })
map("n", "<leader>cf", '<Cmd>let @+ = expand("%:p")<cr>', { desc = "Copy File Path" })

map("n", "<leader>rs", vim.cmd.LspRestart, { desc = "Restart LSP" })

-- Git conflicts
map("n", "<leader>gl", "<Cmd>GitConflictListQf<cr>", { desc = "List Conflict" })
map("n", "<leader>gr", "<Cmd>GitConflictRefresh<cr>", { desc = "Refresh Git Conflict" })

map("n", "gx", "<cmd> execute '!open ' . shellescape(expand('<cfile>'), 1)<CR>", { desc = "Open link" })

-- Spectre
map("n", "<leader>S", "<cmd>lua require('spectre').toggle()<cr>", { desc = "Toggle Spectre" })
map("n", "<leader>sp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
  desc = "Search on current file",
})

-- Toggle Term
map("n", "<leader>t", "<cmd>ToggleTerm<cr>", { desc = "Toggle Terminal" })

-- Exit
map("n", "<leader>q", "<cmd>exit<cr>", { desc = "Exit" })

-- Harpoon
map("n", "<leader>ha", function()
  require("harpoon.mark").add_file()
end, { noremap = true, silent = true, desc = "Add file to harpoon" })

map("n", "<leader>hm", function()
  require("harpoon.ui").toggle_quick_menu()
end, { noremap = true, silent = true, desc = "Toggle Harpoon Menu" })
