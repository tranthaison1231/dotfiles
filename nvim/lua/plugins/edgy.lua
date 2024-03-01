return {
  "folke/edgy.nvim",
  event = "VeryLazy",
  init = function()
    vim.opt.laststatus = 3
    vim.opt.splitkeep = "screen"
  end,
  opts = {
    animate = {
      enabled = false,
    },
    wo = {
      winhighlight = "",
    },
    bottom = {
      {
        ft = "toggleterm",
        wo = {
          winbar = false,
        },
        size = { height = 0.25 },
        filter = function(buf, win)
          return vim.api.nvim_win_get_config(win).relative == ""
        end,
      },
      {
        wo = {
          winbar = false,
        },
        ft = "spectre_panel",
        size = { height = 0.4 },
      },
    },
    left = {
      {
        ft = "neo-tree",
        wo = {
          winbar = false,
        },
        filter = function(buf)
          return vim.b[buf].neo_tree_source == "filesystem"
        end,
        size = { height = 1 },
      },
    },
  },
}
