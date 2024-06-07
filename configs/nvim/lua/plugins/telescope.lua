return {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      -- Telescope Configurations
      require('telescope').setup {
        defaults = {
          file_ignore_patterns = { "node_modules" }, -- Ignore certain directories
          follow = true -- Follow symbolic links
        }
      }

      local builtin = require("telescope.builtin")
      vim.keymap.set('n', '<C-p>', builtin.find_files, {})
      vim.keymap.set('n', '<C-S-f>', builtin.live_grep, {}) -- Map Cmd-Shift-F to live_grep

    end
  }
  
