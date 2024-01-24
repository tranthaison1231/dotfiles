vim.api.nvim_create_augroup("neotree_autoopen", { clear = true })
vim.api.nvim_create_autocmd("BufWinEnter", {
  desc = "Open neo-tree on enter",
  group = "neotree_autoopen",
  callback = function()
    if not vim.g.neotree_opened then
      vim.cmd("Neotree show")
      vim.cmd("ToggleTerm")
      vim.g.neotree_opened = true
    end
  end,
})

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim",
      "nvim-lua/plenary.nvim",
    },
    cmd = "Neotree",
    keys = {
      {
        "<leader>e",
        function()
          require("neo-tree.command").execute({ toggle = true })
        end,
        desc = "Explorer NeoTree (root dir)",
      },
    },
    config = function()
      require("neo-tree").setup({
        filesystem = {
          window = {
            mappings = {
              ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
              ["Y"] = function(state)
                local node = state.tree:get_node()
                local filepath = node:get_id()
                local filename = node.name
                local modify = vim.fn.fnamemodify

                local results = {
                  filepath,
                  modify(filepath, ":."),
                  modify(filepath, ":~"),
                  filename,
                  modify(filename, ":r"),
                  modify(filename, ":e"),
                }

                local messages = {
                  "Choose to copy to clipboard:",
                  "1. Absolute path: " .. results[1],
                  "2. Path relative to CWD: " .. results[2],
                  "3. Path relative to HOME: " .. results[3],
                  "4. Filename: " .. results[4],
                  "5. Filename without extension: " .. results[5],
                  "6. Extension of the filename: " .. results[6],
                }
                vim.api.nvim_echo({ { table.concat(messages, "\n"), "Normal" } }, true, {})
                local i = vim.fn.getchar()

                if i >= 49 and i <= 54 then
                  local result = results[i - 48]
                  print(result)
                  vim.fn.setreg("*", result)
                else
                  print("Invalid choice: " .. string.char(i))
                end
              end,
            },
          },
        },
      })
    end,
  },
}
