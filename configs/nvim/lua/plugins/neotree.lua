return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
      config = function()
        require("neo-tree").setup({
          enable_git_status = true,
          enable_diagnostics = true,

          default_component_configs = {
            name = {
              trailing_slash = false,
              use_git_status_colors = true,
              highlight = "NeoTreeFileName",
            },
            git_status = {
              symbols = {
                -- Change type
                added     = "+", -- or "✚", but this is redundant info if you use git_status_colors on the name
                modified  = "~", -- or "", but this is redundant info if you use git_status_colors on the name
                deleted   = "✖",-- this can only be used in the git_status source
                renamed   = "󰁕",-- this can only be used in the git_status source
                -- Status type
                untracked = "U",
                ignored   = "",
                unstaged  = "󰄱",
                staged    = "",
                conflict  = "",
              }
            },
            file_size = {
              enabled = true,
              required_width = 64, -- min width of window required to show this column
            },
            type = {
              enabled = true,
              required_width = 122, -- min width of window required to show this column
            },
            last_modified = {
              enabled = true,
              required_width = 88, -- min width of window required to show this column
            },
            created = {
              enabled = true,
              required_width = 110, -- min width of window required to show this column
            },
            symlink_target = {
              enabled = false,
            },
          },
          git_status = {
            window = {
              position = "float",
              mappings = {
                ["A"]  = "git_add_all",
                ["gu"] = "git_unstage_file",
                ["ga"] = "git_add_file",
                ["gr"] = "git_revert_file",
                ["gc"] = "git_commit",
                ["gp"] = "git_push",
                ["gg"] = "git_commit_and_push",
                ["o"] = { "show_help", nowait=false, config = { title = "Order by", prefix_key = "o" }},
                ["oc"] = { "order_by_created", nowait = false },
                ["od"] = { "order_by_diagnostics", nowait = false },
                ["om"] = { "order_by_modified", nowait = false },
                ["on"] = { "order_by_name", nowait = false },
                ["os"] = { "order_by_size", nowait = false },
                ["ot"] = { "order_by_type", nowait = false },
              }
            }
          }

        })
      end
    },
  }
