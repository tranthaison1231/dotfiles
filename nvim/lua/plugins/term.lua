return {
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup({
        shade_terminals = false,
      })
      local Terminal = require("toggleterm.terminal").Terminal
      local lazygit = Terminal:new({
        cmd = "lazygit",
        dir = "git_dir",
        direction = "float",
        float_opts = {
          border = "curved",
          width = 9999,
          height = 9999,
        },
        on_open = function(term)
          vim.cmd("startinsert!")
          vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
        end,
        on_close = function()
          vim.cmd("startinsert!")
        end,
        on_exit = function()
          require("neo-tree.sources.manager").refresh("filesystem")
          require("neo-tree.sources.manager").refresh("git_status")
          require("neo-tree.sources.manager").refresh("buffers")
        end,
      })

      function lazygit_toggle()
        lazygit:toggle()
      end

      vim.api.nvim_set_keymap(
        "n",
        "<leader>gg",
        "<cmd>lua lazygit_toggle()<CR>",
        { noremap = true, silent = true, desc = "Lazygit toggle" }
      )
    end,
  },
}
