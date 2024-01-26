return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      options = {
        theme = "dracula",
        component_separators = { left = "│", right = "│" },
        section_separators = { left = "", right = "" },
        globalstatus = true,
        refresh = {
          statusline = 100,
        },
      },
      sections = {
        lualine_a = {
          { "mode", width = 3 },
        },
        lualine_b = {
          { "branch" },
          { "diff" },
        },
        lualine_c = {
          { "%f" },
        },
        lualine_x = {
          { "macro" },
          { "diagnostics" },
        },
        lualine_y = {
          { "filetype", ts_icon = "" },
        },
      },
    },
  },
}
