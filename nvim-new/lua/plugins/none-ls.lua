return {
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      local on_attach = require("lsp/on_attach")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua.with({
            extra_args = { "config-path", "{$HOME}/.config/nvim/lua/stylua.toml" },
          }),
          null_ls.builtins.formatting.prettierd,
          null_ls.builtins.diagnostics.eslint_d,
          null_ls.builtins.diagnostics.eslint,
          null_ls.builtins.completion.spell,
          null_ls.builtins.diagnostics.markdownlint,
        },
        on_attach = on_attach,
      })
    end,
  },
}
