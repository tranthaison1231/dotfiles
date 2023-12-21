return {
  {
    "lewis6991/gitsigns.nvim",
    lazy = true,
    config = function()
      require("gitsigns").setup({
        current_line_blame = true,
        current_line_blame_opts = {
          delay = 100,
        },
        sign_priority = 5,
        signs = {
          add = { hl = "GitSignsAdd", text = "|", numhl = "GitSignsAddNr", linehl = "GitSignsAdd" },
          change = { hl = "GitSignsChange", text = "|", numhl = "GitSignsChangeNr", linehl = "GitSignsChange" },
          delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDelete" },
          topdelete = { hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDelete" },
          changedelete = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChange" },
        },
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          map("n", "<leader>hp", gs.preview_hunk)
        end,
      })
      vim.api.nvim_set_hl(0, "GitSignsAdd", { ctermbg = 0, fg = "#50FA7B" })
      vim.api.nvim_set_hl(0, "GitSignsChange", { ctermbg = 0, fg = "#FFB86C" })
      vim.api.nvim_set_hl(0, "GitSignsDelete", { ctermbg = 0, fg = "#FF5555" })
    end,
  },
}
