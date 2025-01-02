local oil = require('oil')
oil.setup({
  view_options = {
    show_hidden = true,
  },
  lsp_file_methods = {
    enabled = true,
    timeout_ms = 5000,
    autosave_changes = "unmodified"
  },
  keymaps = {
    ["<C-f>"] = function()
      local cwd = oil.get_current_dir()
      require('telescope.builtin').grep_string({
        search = vim.fn.input("Grep [" .. cwd .. "] > "),
        cwd = cwd
      })
    end
  }
})
