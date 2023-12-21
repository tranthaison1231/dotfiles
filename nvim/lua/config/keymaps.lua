local map = vim.keymap.set

-- Rewrite ControlKeys
map("n", "+", "<C-a>")
map("n", "-", "<C-x>")

-- Select all
map("n", "<C-a>", "gg<S-v>G")

-- Copy
map("n", "<C-c>", "yy")
map("v", "<C-c>", "y")
map("n", "<C-v>", "p")

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

-- Git conflict
map("n", "<leader>cb", "<Plug>(git-conflict-both)")
map("n", "<leader>c0", "<Plug>(git-conflict-none)")
map("n", "<leader>ct", "<Plug>(git-conflict-theirs)")
map("n", "<leader>cn", "<Plug>(git-conflict-next-conflict)")
map("n", "<leader>cp", "<Plug>(git-conflict-prev-conflict)")
map("n", "<leader>gq", ":GitConflictListQf <CR>")
