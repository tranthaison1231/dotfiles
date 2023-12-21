-- Define the tools to be installed and the key mapping
local installed_tools = { "codespell", "misspell", "cspell" }
local key_mapping = "<leader>cn"

-- Example config with lazyvim
return {
  -- Auto install those tools with mason
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = installed_tools,
    },
  },
  {
    "nvimtools/none-ls.nvim",
    keys = {
      { key_mapping, "<cmd>NullLsInfo<cr>", desc = "NullLs Info" },
    },
    dependencies = { "mason.nvim", "davidmh/cspell.nvim" },
    event = { "BufReadPre", "BufNewFile" },
    opts = function()
      local cspell = require("cspell")
      local ok, none_ls = pcall(require, "null-ls")

      local cspell_config = {
        diagnostics_postprocess = function(diagnostic)
          diagnostic.severity = vim.diagnostic.severity["HINT"] -- ERROR, WARN, INFO, HINT
        end,
        config = {
          find_json = function(_)
            return vim.fn.expand("~/.config/nvim/cspell.json")
          end,
          on_add_to_json = function(cspell_config_file_path, params, action_name)
            if action_name == "add_to_json" then
              os.execute(
                string.format(
                  "cat %s | jq -S '.words |= sort' | tee %s > /dev/null",
                  cspell_config_file_path,
                  cspell_config_file_path
                )
              )
            end
          end,
        },
      }

      if not ok then
        return
      end

      local b = none_ls.builtins

      local sources = {
        -- spell check
        b.diagnostics.codespell,
        b.diagnostics.misspell,
        -- cspell
        cspell.diagnostics.with(cspell_config),
        cspell.code_actions.with(cspell_config),
      }
      -- Define the debounce value
      local debounce_value = 200
      return {
        sources = sources,
        debounce = debounce_value,
        debug = true,
      }
    end,
  },
}
