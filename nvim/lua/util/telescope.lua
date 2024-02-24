local previewers = require("telescope.previewers")
local builtin = require("telescope.builtin")
local M = {}

local delta = previewers.new_termopen_previewer({
  get_command = function(entry)
    if entry.status == "??" or "A " then
      return { "git", "-c", "core.pager=delta", "-c", "delta.side-by-side=false", "diff", entry.value }
    end
    return { "git", "-c", "core.pager=delta", "-c", "delta.side-by-side=false", "diff", entry.value .. "^!" }
  end,
})

M.git_commits = function(opts)
  opts = opts or {}
  opts.previewer = delta

  builtin.git_commits(opts)
end

M.git_bcommits = function(opts)
  opts = opts or {}
  opts.previewer = delta

  builtin.git_bcommits(opts)
end

M.git_status = function(opts)
  opts = opts or {}
  opts.previewer = delta

  builtin.git_status(opts)
end

return M
