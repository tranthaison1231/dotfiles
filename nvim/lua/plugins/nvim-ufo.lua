return {
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
      {
        "luukvbaal/statuscol.nvim",
        config = function()
          local builtin = require("statuscol.builtin")
          require("statuscol").setup({
            relculright = true,
            ft_ignore = { "neo-tree", "toggleterm", "trouble" },
            segments = {
              {
                sign = {
                  name = { "Diagnostic" },
                  colwidth = 1,
                },
                click = "v:lua.ScSa",
              },
              {
                text = { "  ", builtin.lnumfunc },
                condition = { true, builtin.not_empty },
                click = "v:lua.ScLa",
              },
              {
                text = { " ", builtin.foldfunc, "  " },
                condition = { true, builtin.not_empty },
                click = "v:lua.ScFa",
              },
            },
          })
        end,
      },
    },
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require("ufo").setup({
        provider_selector = function()
          return { "treesitter", "indent" }
        end,
      })
    end,
  },
}
