---@diagnostic disable-next-line: missing-fields
require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"bash",
		"c",
		"html",
		"lua",
		"luadoc",
		"markdown",
		"vim",
		"vimdoc",
	},
	-- Autoinstall languages that are not installed
	auto_install = true,
	highlight = {
		enable = true,
		-- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
		--  If you are experiencing weird indenting issues, add the language to
		--  the list of additional_vim_regex_highlighting and disabled languages for indent.
		additional_vim_regex_highlighting = { "ruby" },
	},
	indent = { enable = true, disable = { "ruby" } },
	textobjects = {
		select = {
			enable = true,

			-- Automatically jump forward to textobj, similar to targets.vim
			lookahead = true,

			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = { query = "@function.outer", desc = "Select outer part of a function" },
				["if"] = { query = "@function.inner", desc = "Select inner part of a function" },
				["ac"] = { query = "@class.outer", desc = "Select outer part of a class" },
				["ic"] = { query = "@class.inner", desc = "Select inner part of a class" },
				["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter" },
				["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter" },
				["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
				["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
				-- You can also use captures from other query groups like `locals.scm`
				-- ['as'] = { query = '@scope', query_group = 'locals', desc = 'Select language scope' },
			},
			-- You can choose the select mode (default is charwise 'v')
			--
			-- Can also be a function which gets passed a table with the keys
			-- * query_string: eg '@function.inner'
			-- * method: eg 'v' or 'o'
			-- and should return the mode ('v', 'V', or '<c-v>') or a table
			-- mapping query_strings to modes.
			selection_modes = {
				-- ['@parameter.outer'] = 'v', -- charwise
				-- ['@function.outer'] = 'V', -- linewise
				-- ['@class.outer'] = '<c-v>', -- blockwise
			},
			-- If you set this to `true` (default is `false`) then any textobject is
			-- extended to include preceding or succeeding whitespace. Succeeding
			-- whitespace has priority in order to act similarly to eg the built-in
			-- `ap`.
			--
			-- Can also be a function which gets passed a table with the keys
			-- * query_string: eg '@function.inner'
			-- * selection_mode: eg 'v'
			-- and should return true or false
			-- include_surrounding_whitespace = true,
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]f"] = "@function.outer",
				["]a"] = "@parameter.outer",
			},
			goto_previous_start = {
				["[f"] = "@function.outer",
				["[a"] = "@parameter.outer",
			},
			goto_next_end = {
				["]F"] = "@function.outer",
				["]A"] = "@parameter.outer",
			},
			goto_previous_end = {
				["[F"] = "@function.outer",
				["[A"] = "@parameter.outer",
			},
		},
	},
})
