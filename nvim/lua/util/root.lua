local M = {}

function M.is_inside_git_repo()
  local git_dir = vim.fn.finddir(".git", vim.fn.expand("%:p:h") .. ";")
  return vim.fn.isdirectory(git_dir) ~= 0
end

return M
