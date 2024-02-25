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

map("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })

map(
  "n",
  "<leader>gs",
  "<cmd>lua require('util.telescope').git_status()<CR>",
  { silent = true, desc = "Git status", noremap = true }
)

map("n", "gr", ":Telescope lsp_references <CR>", { silent = true, desc = "Telescope References" })

map("n", "<leader>gt", ":Telescope git_stash <CR>", { silent = true, desc = "Git stash" })
map("n", "<leader>gb", ":Telescope git_branches <CR>", { silent = true, desc = "Git branch" })

map(
  "n",
  "<leader>gc",
  "<cmd>lua require('util.telescope').git_commits()<CR>",
  { silent = true, desc = "Git Commits", noremap = true }
)
