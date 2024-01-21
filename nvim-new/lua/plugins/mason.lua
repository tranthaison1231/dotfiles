return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "eslint_d",
        "prettier",
        "prettierd",
        "codespell",
        "misspell",
        "cspell",
        "markdownlint",
        "marksman",
        "js-debug-adapter",
        "astro-language-server",
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "solidity",
        "tsserver",
        "eslint",
        "lua_ls"
      },
    },
  },
}
