return {
  {
    "nvim-pack/nvim-spectre",
    lazy = true,
    cmd = { "Spectre" },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      vim.api.nvim_set_hl(0, "SpectreSearch", { bg = "#FF5555", fg = "#F8F8F2" })
      vim.api.nvim_set_hl(0, "SpectreReplace", { bg = "#50FA7B", fg = "#F8F8F2" })

      require("spectre").setup({
        highlight = {
          search = "SpectreSearch",
          replace = "SpectreReplace",
        },
      })
    end,
  },
}
