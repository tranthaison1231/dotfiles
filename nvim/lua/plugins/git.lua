local util = require("util/root")

return {
  {
    "sindrets/diffview.nvim",
    config = function()
      vim.cmd([[highlight DiffAdd guifg=none guibg=#003500]])
      vim.cmd([[highlight DiffDelete guifg=none guibg=#5e0000]])
      vim.cmd([[highlight DiffChange guifg=none guibg=#003500]])

      vim.api.nvim_create_user_command("DiffViewToggle", function()
        if require("diffview.lib").get_current_view() then
          vim.cmd(":DiffviewClose")
        else
          vim.cmd(":DiffviewOpen")
        end
      end, {})
    end,
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    keys = { { "<leader>dv", "<cmd>DiffViewToggle<CR>", desc = "diffview" } },
  },
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    lazy = not util.is_inside_git_repo(),
    config = function()
      vim.cmd([[highlight Incoming guibg=#6272A4]])

      require("git-conflict").setup({
        default_mappings = true,
        debug = false,
        default_commands = true,
        disable_diagnostics = false,
        list_opener = "copen",
        highlights = {
          incoming = "Incoming",
          current = "DiffText",
        },
      })
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    config = function()
      require("gitsigns").setup({
        numhl = true,
        current_line_blame = true,
        current_line_blame_opts = {
          delay = 100,
        },
        watch_gitdir = { interval = 1000, follow_files = true },
        sign_priority = 5,
        signs = {
          add = { text = "▎" },
          change = { text = "▎" },
          delete = { text = "" },
          topdelete = { text = "" },
          changedelete = { text = "▎" },
          untracked = { text = "▎" },
        },
        on_attach = function(buffer)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, desc)
            vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
          end

          map("n", "<leader>ph", gs.preview_hunk, "Preview hunk")
          map("n", "<leader>phi", gs.preview_hunk_inline, "Preview hunk inline")
        end,
      })
    end,
  },
}
