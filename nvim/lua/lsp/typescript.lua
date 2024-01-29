local lsp_config = require("lspconfig")
local on_attach = require("lsp/on_attach")

vim.cmd([[
autocmd BufEnter *.ts  setlocal
    \ shiftwidth=4
    \ filetype=typescript
]])

lsp_config.tsserver.setup({
  keys = {
    {
      "<leader>co",
      function()
        vim.lsp.buf.code_action({
          apply = true,
          context = {
            only = { "source.organizeImports.ts" },
            diagnostics = {},
          },
        })
      end,
      desc = "Organize Imports",
    },
    {
      "<leader>cR",
      function()
        vim.lsp.buf.code_action({
          apply = true,
          context = {
            only = { "source.removeUnused.ts" },
            diagnostics = {},
          },
        })
      end,
      desc = "Remove Unused Imports",
    },
  },
  on_attach = function(client, bufnr)
    client.server_capabilities.document_formatting = false
    on_attach(client, bufnr)

    local ts_utils = require("nvim-lsp-ts-utils")

    ts_utils.setup({
      update_imports_on_move = true,
    })
    ts_utils.setup_client(client)
  end,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" },
  root_dir = function()
    return vim.fn.getcwd()
  end,
})
