function ColorMyPencils(color)
  color = color or "gruvbox"
  vim.cmd.colorscheme(color)

  -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  -- vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#d74f56" })
  -- vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#a4cf69" })
  -- vim.api.nvim_set_hl(0, "DiffChange", { bg = "#63c1e6" })
  -- vim.api.nvim_set_hl(0, "DiffText", { bg = "#49503b", fg = "#282828" })
end

ColorMyPencils("gruvbox")
