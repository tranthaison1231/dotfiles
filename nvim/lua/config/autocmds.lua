local autocmd = vim.api.nvim_create_autocmd

local function augroup(name)
  return vim.api.nvim_create_augroup("auto_group" .. name, { clear = true })
end

autocmd("LspAttach", {
  group = augroup("lsp"),
  callback = function(e)
    local opts = { buffer = e.buf }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    vim.keymap.set("n", "<leader>k", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
    vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
    vim.keymap.set("n", "<leader>rn", function()
      vim.lsp.buf.rename()
    end, opts)
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>ce", vim.lsp.buf.references, opts)
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
