-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.api.nvim_create_augroup("neotree_autoopen", { clear = true })
vim.api.nvim_create_autocmd("BufWinEnter", {
  desc = "Open neo-tree on enter",
  group = "neotree_autoopen",
  callback = function()
    if not vim.g.neotree_opened then
      vim.cmd("Neotree show")
      vim.g.neotree_opened = true
    end
  end,
})
