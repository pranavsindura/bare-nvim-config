require("conform").setup({ -- Autoformat
	notify_on_error = true,
	format_on_save = function(bufnr)
		-- Disable "format_on_save lsp_fallback" for languages that don't
		-- have a well standardized coding style. You can add additional
		-- languages here or re-enable it for the disabled ones.

		if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
			return
		end

		local disable_filetypes = { c = false, cpp = false }
		return {
			timeout_ms = 5000,
			lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
		}
	end,
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettierd" },
		typescript = { "prettierd" },
		javascriptreact = { "prettierd" },
		typescriptreact = { "prettierd" },
		json = { "prettierd" },
		jsonc = { "prettierd" },
		markdown = { "prettierd" },
		html = { "prettierd" },
		cpp = { "clang-format" },
		rust = { "rustfmt" },
		python = { "black" },
		-- Conform can also run multiple formatters sequentially
		-- python = { "isort", "black" },
		--
		-- You can use a sub-list to tell conform to run *until* a formatter
		-- is found.
		-- javascript = { { "prettierd", "prettier" } },
	},
})

vim.keymap.set({ "n", "x" }, "<leader>lf", function()
	require("conform").format({ async = true, lsp_fallback = true })
end)
