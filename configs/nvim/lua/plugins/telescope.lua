return {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' },
    lazy = false,
    config = function()
      -- Telescope Configurations
      require('telescope').setup {
        defaults = {
          file_ignore_patterns = { "node_modules" }, -- Ignore certain directories
          follow = true -- Follow symbolic links
        }
      }

      print(myOS, mainMod)

      local builtin = require("telescope.builtin")
      vim.keymap.set('n', '<'..mainMod..'-p>', builtin.find_files, {})
      vim.keymap.set('n', '<'..mainMod..'-f>', builtin.live_grep, {})
    end
  }

