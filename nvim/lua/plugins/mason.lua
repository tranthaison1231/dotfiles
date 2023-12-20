return {
  -- cmdline tools and lsp servers
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        -- formatters
        "eslint_d",
        "prettier",
        "prettierd",
        -- code spell
        "codespell",
        "misspell",
        "cspell",
        -- markdown
        "markdownlint",
        -- astro
        "astro-language-server",
        -- Solidity
        "solidity",
      },
    },
  },
}
