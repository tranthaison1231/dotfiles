-- Only load those plugins if the current buffer is a git repository
local is_inside_git_repo = function()
  local git_dir = vim.fn.finddir(".git", vim.fn.expand("%:p:h") .. ";")
  return vim.fn.isdirectory(git_dir) ~= 0
end

return {
  "akinsho/git-conflict.nvim",
  version = "*",
  lazy = not is_inside_git_repo(),
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
