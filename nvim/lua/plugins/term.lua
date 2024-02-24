local util = require("util/root")

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

      function LazygitEdit(original_buffer)
        ---@diagnostic disable-next-line: param-type-mismatch
        local current_bufnr = vim.fn.bufnr("%")
        local channel_id = vim.fn.getbufvar(current_bufnr, "terminal_job_id")

        if not channel_id then
          vim.notify("No terminal job ID found.", vim.log.levels.ERROR)
          return
        end

        vim.fn.chansend(channel_id, "\15") -- \15 is <c-o>
        vim.cmd("close") -- Close Lazygit

        local relative_filepath = util.getRelativeFilepath(5, 50)
        if not relative_filepath then
          vim.notify("Clipboard is empty or invalid.", vim.log.levels.ERROR)
          return
        end

        local winid = vim.fn.bufwinid(original_buffer)

        if winid == -1 then
          vim.notify("Could not find the original window.", vim.log.levels.ERROR)
          return
        end

        vim.fn.win_gotoid(winid)
        vim.cmd("e " .. relative_filepath)
      end

      function lazygit_open()
        local current_buffer = vim.api.nvim_get_current_buf()

        lazygit:open()

        vim.api.nvim_buf_set_keymap(
          lazygit.bufnr,
          "t",
          "<c-e>",
          string.format([[<Cmd>lua LazygitEdit(%d)<CR>]], current_buffer),
          { noremap = true, silent = true }
        )
      end

      vim.api.nvim_set_keymap(
        "n",
        "<leader>gg",
        "<cmd>lua lazygit_open()<CR>",
        { noremap = true, silent = true, desc = "Lazygit toggle" }
      )
    end,
  },
}
