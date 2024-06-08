return {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' },
    lazy = false,
    config = function()
      -- Telescope Configurations
      require('telescope').setup {
        defaults = {
          file_ignore_patterns = { "node_modules", ".git" }, -- Ignore certain directories
          follow = true -- Follow symbolic links
        }
      }

      local builtin = require("telescope.builtin")
      vim.keymap.set('n', '<'..MainMod..'-p>', builtin.find_files, {})
      vim.keymap.set('n', '<'..MainMod..'-f>', builtin.live_grep, {})
    end
  }

