return { 
  'nvim-treesitter/nvim-treesitter',
  run = ':TSUpdate',
  config = function()
    -- nvim-treesitter Configuration
    local config = require('nvim-treesitter.configs')
    config.setup {
      ensure_installed = {"bash",
      "css",
      "html",
      "javascript",
      "json",
      "lua",
      "python",
      "typescript",
      "yaml",
      "markdown"
      },
    
      highlight = {
        enable = true,                -- Enable syntax highlighting
        additional_vim_regex_highlighting = false,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },
      },
    }
  end
}
  
