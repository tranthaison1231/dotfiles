local keymap = vim.keymap.set

-- Rewrite ControlKeys
keymap("n", "+", "<C-a>")
keymap("n", "-", "<C-x>")

-- Select all
keymap("n", "<C-a>", "gg<S-v>G")

-- Copy
keymap("n", "<C-c>", "yy")
keymap("v", "<C-c>", "y")
keymap("n", "<C-v>", "p")

-- Google Search
local searching_google_in_normal =
  [[:lua vim.fn.system({'open', 'https://google.com/search?q=' .. vim.fn.expand("<cword>")})<CR>]]
local searching_google_in_visual =
  [[<ESC>gv"gy<ESC>:lua vim.fn.system({'open', 'https://google.com/search?q=' .. vim.fn.getreg('g')})<CR>]]

keymap("n", "<C-g>", searching_google_in_normal, { silent = true, noremap = true })
keymap("v", "<C-g>", searching_google_in_visual, { silent = true, noremap = true })

-- Open folder on current buffer
local open_folder = [[:lua vim.fn.system({ 'open', vim.fn.expand("<cfile")})<CR>]]

keymap("n", "<leader>o", open_folder, { silent = true, noremap = true })
