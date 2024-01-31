local lsp_config = require("lspconfig")
local on_attach = require("lsp/on_attach")

lsp_config.eslint.setup({
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        if vim.fn.exists(":EslintFixAll") > 0 then
          vim.cmd("EslintFixAll")
        end
      end,
    })
  end,
})
