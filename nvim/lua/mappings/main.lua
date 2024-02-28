local map = vim.keymap.set

map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })
map({ "n", "v" }, "<leader>d", '"_dd', { desc = "Delete without copy" })
map("n", "<leader>l", "<cmd>noh<CR>", { desc = "Clear highlights" })
-- Disable arrow keys
map("n", "<Up>", "<NOP>")
map("n", "<Down>", "<NOP>")
map("n", "<Left>", "<NOP>")
map("n", "<Right>", "<NOP>")

-- Rewrite ControlKeys
map("n", "+", "<C-a>")
map("n", "-", "<C-x>")

map("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })

map("n", "<C-d>", "<C-d>zz", { desc = "Keeps cursor centered when down a page" })
map("n", "<C-u>", "<C-u>zz", { desc = "Keeps cursor centered when up a page" })

map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save current file" })
map({ "i", "x", "n", "s" }, "<C-S>", "<cmd>wa<cr><esc>", { desc = "Save all file" })

map("n", "<C-x>", "dd", { desc = "Cut" })
map("n", "<C-c>", "yy", { desc = "Copy current line" })
map("v", "<C-c>", "y", { desc = "Copy" })
map("n", "<C-v>", "p", { desc = "Paste" })

map("v", "<M-j>", ":m '>+1<CR>gv=gv", { desc = "Move line up", silent = true })
map("v", "<M-k>", ":m '<-2<CR>gv=gv", { desc = "Move line down", silent = true })

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

-- Exit
map("n", "<C-q>", "<cmd>exit<cr>", { desc = "Exit" })

-- Move block
map("n", "<tab>", ">>", { desc = "Move block right" })
map("n", "<s-tab>", "<<", { desc = "Move block left" })
map("v", "<tab>", ">gv", { desc = "Move block right" })
map("v", "<s-tab>", "<gv", { desc = "Move block left" })
map("i", "<S-Tab>", "<C-\\><C-N><<<C-\\><C-N>^i", { desc = "Move block left" })

-- Search
map("v", "/", 'y/<C-R>"<CR>N', { silent = true, desc = "Search selected text" })

-- Eslint
map("n", "<leader>ff", ":EslintFixAll <CR>", { silent = true, desc = "Fix all eslint errors" })
