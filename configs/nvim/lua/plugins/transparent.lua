return {
  "xiyaowong/transparent.nvim",
  config = function ()
    vim.g.transparent_groups = vim.list_extend(vim.g.transparent_groups or {}, { "ExtraGroup" })
  end
}

