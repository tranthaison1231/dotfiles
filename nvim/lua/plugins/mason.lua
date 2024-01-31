return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "prettierd",
        "codespell",
        "misspell",
        "cspell",
        "markdownlint",
        "marksman",
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "solidity",
        "prismals",
        "tsserver",
        "eslint",
        "lua_ls",
      },
    },
  },
}
