return {
  {
    "nvimtools/none-ls.nvim",
    dependencies = { "mason.nvim" },
    config = function()
      local null_ls = require("null-ls")
      local on_attach = require("lsp/on_attach")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.prettierd,
          null_ls.builtins.diagnostics.eslint_d.with({
            condition = function(utils)
              return utils.root_has_file({ ".eslintrc.js", ".eslintrc.json", ".eslintrc.cjs" })
            end,
          }),
          null_ls.builtins.completion.spell,
          null_ls.builtins.diagnostics.markdownlint,
        },
        on_attach = on_attach,
      })
    end,
  },
}
