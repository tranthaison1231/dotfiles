return {
  {
    "williamboman/mason.nvim",
    lazy = false,
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
        "js-debug-adapter",
        "astro-language-server",
        "solidity",
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "tsserver"
      }
    } 
  }
}
