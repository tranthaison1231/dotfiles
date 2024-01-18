-- Only load those plugins if the current buffer is a git repository
local util = require("util/root")

return {
  "akinsho/git-conflict.nvim",
  version = "*",
  lazy = not util.is_inside_git_repo(),
  config = function()
    vim.cmd([[highlight Incoming guibg=#6272A4]])

    require("git-conflict").setup({
      default_mappings = true,
      debug = false,
      default_commands = true,
      disable_diagnostics = false,
      list_opener = "copen",
      highlights = {
        incoming = "Incoming",
        current = "DiffText",
      },
    })
  end,
}

