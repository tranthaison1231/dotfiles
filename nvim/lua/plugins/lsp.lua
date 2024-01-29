return {
  { "folke/neodev.nvim", opts = {} },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("neodev").setup({})
      require("lsp")
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({
        symbol_in_winbar = {
          enable = false,
        },
        ui = {
          border = "rounded",
        },
        beacon = {
          enable = false,
        },
      })
    end,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  },
}
