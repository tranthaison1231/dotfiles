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
            segments = {
              {
                sign = {
                  name = { "Diagnostic" },
                  maxwidth = 1,
                  auto = true,
                },
                click = "v:lua.ScSa",
              },
              {
                text = {
                  function()
                    return "%="
                  end,
                  builtin.foldfunc,
                },
                click = "v:lua.ScFa",
                auto = true,
              },
              {
                text = {
                  function(args)
                    return (args.relnum == 0) and " " or ""
                  end,
                },
              },
              {
                text = {
                  builtin.lnumfunc,
                  " ",
                },
              },
            },
          })
        end,
      },
    },
    config = function()
      require("ufo").setup({
        provider_selector = function()
          return { "treesitter", "indent" }
        end,
      })
    end,
  },
}
