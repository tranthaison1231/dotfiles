return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<C-j>",
            next = "<C-n]>",
            dismiss = "<C-]>",
          },
        },
        server_opts_overrides = {},
      })
    end,
  },
}
