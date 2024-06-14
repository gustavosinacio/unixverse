return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {},
  config = function()
    local highlight = {
      "RainbowDarker",
      "RainbowDark",
      -- "RainbowBlue",
    }

    local hooks = require("ibl.hooks")
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "RainbowDark", { fg = "#252525" })
      vim.api.nvim_set_hl(0, "RainbowDarker", { fg = "#303030" })
      -- vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    end)

    require("ibl").setup({ indent = { highlight = highlight } })
  end,
}