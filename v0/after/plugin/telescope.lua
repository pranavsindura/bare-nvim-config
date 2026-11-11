require("telescope").setup({
	-- You can put your default mappings / updates / etc. in here
	--  All the info you're looking for is in `:help telescope.setup()`
	--
	defaults = {
		mappings = {
			i = {
				["<c-enter>"] = "to_fuzzy_refine",
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
	-- pickers = {}
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown(),
		},
	},
})

-- Enable Telescope extensions if they are installed
pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "ui-select")

-- See `:help telescope.builtin`
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[F]ind [K]eymaps" })
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
vim.keymap.set("n", "<leader>fF", function()
	builtin.find_files({
		previewer = false,
		hidden = true,
		no_ignore = true,
	})
end, { desc = "[F]ind all [F]iles" })
vim.keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "[F]ind [C]urrent Word" })
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
vim.keymap.set("n", "<leader>f/", builtin.current_buffer_fuzzy_find, { desc = "[F]ind in [/] current buffer" })
vim.keymap.set("n", "<leader>fw", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, {})
vim.keymap.set("n", "<leader>fg", builtin.git_status, {})
