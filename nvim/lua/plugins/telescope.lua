return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "axkirillov/telescope-changed-files",
    },
    keys = {
      { "<leader><space>", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    },
    config = function()
      require("telescope").load_extension("changed_files")
    end,
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
