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
    vim.keymap.set("n", "gD", "<cmd> Lspsaga peek_definition <CR>", opts("Declaration"))
    vim.keymap.set("n", "gd", "<cmd> Lspsaga goto_definition <CR>", opts("Definition"))
    vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc <CR>", opts("Hover"))
    vim.keymap.set("n", "gli", "<cmd> Lspsaga incoming_calls<CR>", opts("Incoming call"))
    vim.keymap.set("n", "glo", "<cmd> Lspsaga outgoing_calls<CR>", opts("Outgoing call"))
    vim.keymap.set("n", "<leader>k", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts("Signature Help"))
    vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts(" Go prev Diagnostic"))
    vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts("Go next Diagnostic"))
    vim.keymap.set("n", "<leader>rn", "<cmd> Lspsaga rename <CR>", opts("Rename"))
    vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd> Lspsaga code_action <CR>", opts("Code Action"))
    vim.keymap.set("n", "<leader>ce", vim.lsp.buf.references, opts("References"))
    vim.keymap.set("n", "<leader>co", function()
      vim.lsp.buf.code_action({
        apply = true,
        context = {
          only = { "source.organizeImports.ts" },
          diagnostics = {},
        },
      })
    end, opts("Org Import"))
    vim.keymap.set("n", "<leader>cR", function()
      vim.lsp.buf.code_action({
        apply = true,
        context = {
          only = { "source.removeUnused.ts" },
          diagnostics = {},
        },
      })
    end, opts("Remove Unused"))
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

autocmd("FileType", {
  group = augroup("Spectre"),
  pattern = "spectre_panel",
  callback = function()
    vim.opt_local.statuscolumn = ""
    vim.opt_local.foldcolumn = "0"
  end,
})
