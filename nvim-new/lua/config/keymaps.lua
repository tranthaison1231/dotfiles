local map = vim.keymap.set

-- Quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

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

-- Save
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Copy
map("n", "<C-c>", "yy")
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

map("n", "<leader>o", open_folder, { silent = true, noremap = true })

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