return {
  "sindrets/diffview.nvim",
  dependencies = "nvim-lua/plenary.nvim",
  cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  keys = {
    { "<leader>gd", "<cmd>DiffviewOpen<cr>",          desc = "Git Diff Tool" },
    { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "Git File History" },
  },
}
