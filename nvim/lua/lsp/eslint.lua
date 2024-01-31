local lsp_config = require("lspconfig")
local on_attach = require("lsp/on_attach")

lsp_config.eslint.setup({
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
  end,
})
