local function format(opts)
  opts = vim.tbl_deep_extend("force", {}, opts or {}, require("lazyvim.util").opts("nvim-lspconfig").format or {})
  local ok, conform = pcall(require, "conform")
  if ok then
    opts.formatters = {}
    opts.lsp_fallback = true
    conform.format(opts)
  else
    vim.lsp.buf.format(opts)
  end
end

return {
  {
    "nvimtools/none-ls.nvim",
    event = "LazyFile",
    dependencies = { "mason.nvim" },
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
          require("lazyvim.util").format.register({
            name = "none-ls.nvim",
            priority = 200, -- set higher than conform, the builtin formatter
            primary = true,
            format = function(buf)
              return format({
                bufnr = buf,
                filter = function(client)
                  return client.name == "null-ls"
                end,
              })
            end,
            sources = function(buf)
              local ret = require("null-ls.sources").get_available(vim.bo[buf].filetype, "NULL_LS_FORMATTING") or {}
              return vim.tbl_map(function(source)
                return source.name
              end, ret)
            end,
          })
        end,
      })
    end,
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.root_dir = opts.root_dir
        or require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git")
      opts.sources = vim.list_extend(opts.sources or {}, {
        nls.builtins.formatting.fish_indent,
        nls.builtins.diagnostics.fish,
        nls.builtins.formatting.stylua,
        nls.builtins.formatting.shfmt,
        nls.builtins.formatting.prettier,
      })
    end,
  },
}
