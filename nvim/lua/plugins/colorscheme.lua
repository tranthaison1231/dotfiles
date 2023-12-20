return {
  {
    "Mofiqul/dracula.nvim",
    lazy = true,
    config = function()
      require("dracula").setup()
    end,
  },
  { "LazyVim/LazyVim", opts = {
    colorscheme = "dracula",
  } },
}
