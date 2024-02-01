return {
  { "folke/neodev.nvim", opts = {} },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("neodev").setup({})
      require("mason").setup({
        ensure_installed = {
          "stylua",
          "codespell",
          "misspell",
          "cspell",
          "markdownlint",
          "marksman",
        },
      })
      require("mason-lspconfig").setup({
        ensure_installed = {
          "solidity",
          "prismals",
          "tsserver",
          "eslint",
          "lua_ls",
        },
        handlers = {
          function(server_name)
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            lspconfig[server_name].setup({
              capabilities = capabilities,
            })
          end,
        },
      })
    end,
  },
  {
    "toppair/peek.nvim",
    event = { "VeryLazy" },
    build = "deno task --quiet build:fast",
    config = function()
      require("peek").setup({
        app = "browser",
      })
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})

      vim.api.nvim_set_keymap("n", "<leader>mp", ":PeekOpen<CR>", { desc = "Markdown preview" })
    end,
  },
}
