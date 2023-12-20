return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    lazy = true,
    dependencies = {
      { "MunifTanjim/nui.nvim" },
      { "nvim-tree/nvim-web-devicons" },
      { "3rd/image.nvim" },
    },
    config = function()
      require("neo-tree").setup({
        filesystem = {
          window = {
            mappings = {
              ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
            },
          },
        },
      })
    end,
  },
}
