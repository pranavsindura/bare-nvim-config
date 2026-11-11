return {
  "stevearc/oil.nvim",
  opts = {
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
        local cwd = require('oil').get_current_dir()
        require('telescope.builtin').grep_string({
          search = vim.fn.input("Grep [" .. cwd .. "] > "),
          cwd = cwd
        })
      end
    }
  },
  setup = function()
    -- Enable Telescope extensions if they are installed
    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select")

    -- See `:help telescope.builtin`
    local builtin = require("telescope.builtin")
    -- vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
    -- vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[F]ind [K]eymaps" })
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
    vim.keymap.set("n", "<leader>fF", function()
      builtin.find_files({
        previewer = false,
        hidden = true,
        no_ignore = true,
      })
    end, { desc = "[F]ind all [F]iles" })
    vim.keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "[F]ind [C]urrent Word" })
    -- vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
    vim.keymap.set("n", "<leader>f/", builtin.current_buffer_fuzzy_find, { desc = "[F]ind in [/] current buffer" })
    vim.keymap.set("n", "<leader>fw", function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end, {})
    vim.keymap.set("n", "<leader>fg", builtin.git_status, {})
  end
}
