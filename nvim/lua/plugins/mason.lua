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
        "astro-language-server",
        "solidity",
      },
    },
  },
}
