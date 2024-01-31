return {
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    dependencies = { "mason.nvim" },
    config = function()
      local null_ls = require("null-ls")
      local on_attach = require("lsp/on_attach")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.completion.spell,
          null_ls.builtins.diagnostics.markdownlint,
          null_ls.builtins.diagnostics.codespell,
        },
        on_attach = on_attach,
      })
    end,
  },
}
