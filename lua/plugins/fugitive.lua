return {
  "tpope/vim-fugitive",
  config = function()
    vim.keymap.set("n", "<leader>gg", function()
      vim.cmd("tabnew +G")
      vim.cmd("resize 15")
    end, {})
  end
}
