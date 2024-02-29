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
              { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
              {
                sign = { name = { "Diagnostic" }, maxwidth = 2, auto = true },
                click = "v:lua.ScSa",
              },
              { text = { builtin.lnumfunc }, click = "v:lua.ScLa" },
              {
                sign = { name = { ".*" }, maxwidth = 2, colwidth = 1, auto = true, wrap = true },
                click = "v:lua.ScSa",
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
