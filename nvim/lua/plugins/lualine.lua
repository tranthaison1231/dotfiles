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
          {
            "branch",
            on_click = function()
              vim.cmd(":Telescope git_branches")
            end,
          },
        },
        lualine_c = {
          { "diagnostics" },
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          {
            "%f",
            on_click = function()
              vim.fn.setreg("*", vim.fn.expand("%:~"))
            end,
          },
        },
        lualine_x = {
          "fileformat",
          {
            "diff",
            on_click = function()
              vim.cmd(":DiffviewOpen")
            end,
          },
        },
        lualine_y = {
          { "progress", separator = " ", padding = { left = 1, right = 1 } },
        },
      },
      extensions = { "neo-tree", "lazy", "toggleterm" },
    },
  },
}
