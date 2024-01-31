local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("config.options")
require("lazy").setup({
  spec = { { import = "plugins" } },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    cache = {
      enabled = true,
      -- disable_events = {},
    },
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip", -- "matchit",
        -- "matchparen",
        "netrwPlugin",
        "rplugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  debug = false,
})
require("config.keymaps")
require("config.autocmds")
