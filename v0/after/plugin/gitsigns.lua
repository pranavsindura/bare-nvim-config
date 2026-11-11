require("gitsigns").setup({
	on_attach = function(bufnr)
		local gitsigns = require("gitsigns")

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		map("n", "]c", function()
			if vim.wo.diff then
				vim.cmd.normal({ "]c", bang = true })
			else
				gitsigns.nav_hunk("next")
			end
		end, { desc = "Jump to next git [c]hange" })

		map("n", "[c", function()
			if vim.wo.diff then
				vim.cmd.normal({ "[c", bang = true })
			else
				gitsigns.nav_hunk("prev")
			end
		end, { desc = "Jump to previous git [c]hange" })

		map("n", "<leader>gd", function()
			vim.cmd("tabnew %")
			gitsigns.diffthis()
		end, { desc = "git [d]iff file" })

		-- Actions
		-- normal mode
		map("n", "<leader>gr", gitsigns.reset_hunk, {})
		map("n", "<leader>gR", gitsigns.reset_buffer, {})
		map("n", "<leader>gp", gitsigns.preview_hunk, {})
		map("n", "<leader>gb", gitsigns.blame_line, {})
	end,
})
