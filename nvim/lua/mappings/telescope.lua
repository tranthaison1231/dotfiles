local telescope_builtin = require("telescope.builtin")

local map = vim.keymap.set

map("n", "<leader>ss", function()
  require("telescope.builtin").spell_suggest(require("telescope.themes").get_dropdown({
    previewer = false,
  }))
end, { desc = "Search Spelling suggestions" })

map("n", "<leader>/", "<cmd>GrepInDirectory<CR>", { noremap = true, silent = true, desc = "Grep in Directory" })

map("n", "<C-f>", function()
  require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
    previewer = false,
  }))
end, { desc = "Fuzzily search in current buffer]" })

map("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "Find recently opened files" })

map("n", "<leader>fb", function()
  telescope_builtin.buffers({
    show_all_buffers = true,
    sort_lastused = true,
    ignore_current_buffer = true,
  })
end, { silent = true, desc = "Find Buffers" })

map("n", "<leader><space>", "<cmd>Telescope find_files<cr>", { desc = "Find files" })

map("n", "<leader>fg", function()
  telescope_builtin.live_grep({
    find_command = { "rg", "--ignore", "--hidden", "--files" },
  })
end, { silent = true, desc = "Live Grep" })

map(
  "n",
  "<leader>gs",
  "<cmd>lua require('util.telescope').git_status()<CR>",
  { silent = true, desc = "Git status", noremap = true }
)

map("n", "gr", ":Telescope lsp_references <CR>", { silent = true, desc = "Telescope References" })

map("n", "<leader>ma", ":Telescope marks <CR>", { silent = true })
map("n", "<leader>gt", ":Telescope git_stash <CR>", { silent = true, desc = "Git stash" })
map("n", "<leader>gb", ":Telescope git_branches <CR>", { silent = true, desc = "Git branch" })

map(
  "n",
  "<leader>gc",
  "<cmd>lua require('util.telescope').git_commits()<CR>",
  { silent = true, desc = "Git Commits", noremap = true }
)

vim.api.nvim_create_user_command("config", function()
  require("telescope.builtin").find_files({ cwd = "~/.config/nvim" })
end, {})
