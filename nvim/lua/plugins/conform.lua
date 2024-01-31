return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    config = function()
      vim.api.nvim_create_user_command("FormatDisable", function(args)
        if args.bang then
          vim.b.disable_autoformat = true
        else
          vim.g.disable_autoformat = true
        end
      end, {
        desc = "Disable autoformat-on-save",
        bang = true,
      })

      vim.api.nvim_create_user_command("FormatEnable", function()
        vim.b.disable_autoformat = false
        vim.g.disable_autoformat = false
      end, {
        desc = "Re-enable autoformat-on-save",
      })

      require("conform").setup({
        format_on_save = function(bufnr)
          if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
            return
          end
          return { timeout_ms = 3000, lsp_fallback = true }
        end,
        formatters_by_ft = {
          bash = { "shfmt" },
          sh = { "shfmt" },
          fish = { "fish_indent" },
          lua = { "stylua" },
          go = { "goimports", "gofumpt", "goimports-reviser" },
          javascript = { { "prettier" } },
          typescript = { { "prettier" } },
          javascriptreact = { { "prettier" } },
          typescriptreact = { { "prettier" } },
          vue = { { "prettier" } },
          css = { { "prettier" } },
          scss = { { "prettier" } },
          less = { { "prettier" } },
          html = { { "prettier" } },
          json = { { "prettier" } },
          jsonc = { { "prettier" } },
          yaml = { { "prettier" } },
          markdown = { { "prettier" } },
          ["markdown.mdx"] = { { "prettier" } },
          graphql = { { "prettier" } },
          handlebars = { { "prettier" } },
        },
      })
    end,
  },
}
