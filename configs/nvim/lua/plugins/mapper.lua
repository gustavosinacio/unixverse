return {
  "lazytanuki/nvim-mapper",
  before = "telescope.nvim",
  config = function()
    require("nvim-mapper").setup({
      no_map = false,
      -- where should ripgrep look for your keybinds definitions.
      -- Default config search path is ~/.config/nvim/lua
      -- search_path = "~/i3life/configs/nvim/lua",
      -- what should be done with the selected keybind when pressing enter.
      -- Available actions:
      --   * "definition" - Go to keybind definition (default)
      --   * "execute" - Execute the keybind command
      action_on_enter = "definition",
    })
  end,
}
