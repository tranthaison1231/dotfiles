local map = vim.keymap.set

map("n", "<leader>xx", function()
  require("trouble").toggle()
end, { desc = "Trouble: Toggle" })

map("n", "<leader>xw", function()
  require("trouble").toggle("workspace_diagnostics")
end, { desc = "Trouble: Workspace Diagnostics" })

map("n", "<leader>xd", function()
  require("trouble").toggle("document_diagnostics")
end, { desc = "Trouble: Document Diagnostics" })

map("n", "<leader>xq", function()
  require("trouble").toggle("quickfix")
end, { desc = "Trouble: Quickfix" })

map("n", "<leader>xl", function()
  require("trouble").toggle("loclist")
end, { desc = "Trouble: Location List" })

map("n", "gR", function()
  require("trouble").toggle("lsp_references")
end, { desc = "Trouble: LSP References" })
