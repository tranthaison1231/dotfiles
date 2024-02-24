local M = {}

function M.getRelativeFilepath(retries, delay)
  local relative_filepath
  ---@diagnostic disable-next-line: unused-local
  for i = 1, retries do
    relative_filepath = vim.fn.getreg("+")
    if relative_filepath ~= "" then
      return relative_filepath
    end
    vim.loop.sleep(delay)
  end
  return nil
end

function M.is_inside_git_repo()
  local git_dir = vim.fn.finddir(".git", vim.fn.expand("%:p:h") .. ";")
  return vim.fn.isdirectory(git_dir) ~= 0
end

return M
