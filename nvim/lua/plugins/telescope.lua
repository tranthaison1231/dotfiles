return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader><space>", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    },
  },
  {
    "princejoogie/dir-telescope.nvim",
    config = function()
      require("dir-telescope").setup({
        -- these are the default options set
        hidden = true,
        no_ignore = false,
        show_preview = true,
      })
    end,
  },
}
