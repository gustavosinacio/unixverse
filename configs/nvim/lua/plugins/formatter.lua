return {
  "mhartington/formatter.nvim",
  config = function()
    -- formatter.nvim Configuration
    require("formatter").setup({
      logging = false,
      filetype = {
        -- File types go here ------------------------------------------------------
        ----------------------------------------------------------------------------
        lua = {
          function()
            return {
              exe = "luafmt",
              args = { "--indent-count", 2, "--stdin" },
              stdin = true,
            }
          end,
        },
        ----------------------------------------------------------------------------
        javascript = {
          function()
            return {
              exe = "prettier",
              args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote" },
              stdin = true,
            }
          end,
        },
        ----------------------------------------------------------------------------
      },
    })

    -- vim.keymap.set("n", "<leader>f", ":Format<CR>", { noremap = true, silent = false })
  end,
}