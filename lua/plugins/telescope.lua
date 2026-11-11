return {
  "nvim-telescope/telescope.nvim",
  -- Note: use 'dependencies' instead of 'requires' in lazy.nvim
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    -- Add the native FZF sorter here:
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make" -- Compiles the C source code for lightning fast filtering
    },
  },
  config = function(_, opts)
    require("telescope").setup({
      defaults = {
        -- Tell telescope to use the FZF sorter by default
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        },
        mappings = {
          i = {
            ["<c-y>"] = "select_default",
            ["<c-n>"] = "move_selection_next",
            ["<c-p>"] = "move_selection_previous",
          },
        },
        git_worktrees = vim.g.git_worktrees,
        path_display = { "truncate" },
        layout_config = {
          horizontal = { prompt_position = "bottom", preview_width = 0.55 },
          vertical = { mirror = false },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
        -- Configure the FZF extension behavior
        fzf = {
          fuzzy = true,                   -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true,    -- override the file sorter
          case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
        }
      },
    })

    -- Load the extensions
    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select")

    -- Keymaps
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
    vim.keymap.set("n", "<leader>fF", function()
      builtin.find_files({
        previewer = false,
        hidden = true,
        no_ignore = true,
      })
    end, { desc = "[F]ind all [F]iles" })
    vim.keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "[F]ind [C]urrent Word" })
    vim.keymap.set("n", "<leader>f/", builtin.current_buffer_fuzzy_find, { desc = "[F]ind in [/] current buffer" })
    vim.keymap.set("n", "<leader>fw", function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end, {})
    vim.keymap.set("n", "<leader>fg", builtin.git_status, {})
  end
}
