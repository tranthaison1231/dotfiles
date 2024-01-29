local function augroup(name)
  return vim.api.nvim_create_augroup("auto_group_" .. name, { clear = true })
end

-- Auto run eslint fix before save if eslint is installed
vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup("eslint"),
  callback = function()
    if vim.fn.exists(":EslintFixAll") > 0 then
      vim.cmd("EslintFixAll")
    end
  end,
})
