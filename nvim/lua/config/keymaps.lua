local map = vim.keymap.set

map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })
map({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without copy" })

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
map("v", "<M-j>", ":m '>+1<CR>gv=gv")
map("v", "<M-k>", ":m '<-2<CR>gv=gv")

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
end)

-- Toggle Terms
map("t", "<esc>", [[<C-\><C-n>]], opts)
map("n", "<leader>tt", function()
  vim.cmd("ToggleTerm")
end)

-- Diagnostic
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

-- Rename
map("n", "<leader>cr", "<Cmd>Lspsaga rename<cr>", opts)

-- Mason
map("n", "<leader>cm", "<Cmd>Mason<cr>", opts)

-- Copy file paths
map("n", "<leader>cp", '<cmd>let @+ = expand("%")<cr>', { desc = "Copy File Name" })
map("n", "<leader>cf", '<cmd>let @+ = expand("%:p")<cr>', { desc = "Copy File Path" })

map("n", "<leader>rs", vim.cmd.LspRestart, { desc = "Restart LSP" })
