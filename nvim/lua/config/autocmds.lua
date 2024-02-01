local autocmd = vim.api.nvim_create_autocmd

local function augroup(name)
  return vim.api.nvim_create_augroup("auto_group" .. name, { clear = true })
end

autocmd("LspAttach", {
  group = augroup("lsp"),
  callback = function(e)
    local function opts(desc)
      return { buffer = e.buf, desc = desc }
    end
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts("Declaration"))
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts("Definition"))
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts("Hover"))
    vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts("Implementation"))
    vim.keymap.set("n", "<leader>k", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts("Signature Help"))
    vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts(" Go prev Diagnostic"))
    vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts("Go next Diagnostic"))
    vim.keymap.set("n", "<leader>rn", function()
      vim.lsp.buf.rename()
    end, opts("Rename"))
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("Code Action"))
    vim.keymap.set("n", "<leader>ce", vim.lsp.buf.references, opts("References"))
    vim.keymap.set("n", "<leader>co", function()
        vim.lsp.buf.code_action({
          apply = true,
          context = {
            only = { "source.organizeImports.ts" },
            diagnostics = {},
          },
        })
      end,
      opts("Org Import"))
    vim.keymap.set("n", "<leader>cR", function()
        vim.lsp.buf.code_action({
          apply = true,
          context = {
            only = { "source.removeUnused.ts" },
            diagnostics = {},
          },
        })
      end,
      opts("Remove Unused"))
  end,
})

autocmd("BufWritePre", {
  group = augroup("Eslint"),
  callback = function()
    if vim.fn.exists(":EslintFixAll") > 0 then
      vim.cmd("EslintFixAll")
    end
  end,
})
