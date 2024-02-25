return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "princejoogie/dir-telescope.nvim",
    config = function()
      require("dir-telescope").setup({
        hidden = true,
        no_ignore = false,
        show_preview = true,
      })
    end,
  },
}
