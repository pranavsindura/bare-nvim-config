vim.api.nvim_create_user_command("ToggleBufferFormatOnSave", function()
	vim.b.disable_autoformat = not vim.b.disable_autoformat
	local enabledString = ""
	if vim.b.disable_autoformat then
		enabledString = "DISABLED"
	else
		enabledString = "ENABLED"
	end
	print("Buffer Format on Save: " .. enabledString)
end, {
	desc = "Toggle autoformat-on-save for buffer",
})

vim.api.nvim_create_user_command("ToggleFormatOnSave", function()
	vim.g.disable_autoformat = not vim.g.disable_autoformat
	local enabledString = ""
	if vim.g.disable_autoformat then
		enabledString = "DISABLED"
	else
		enabledString = "ENABLED"
	end
	print("Global Format on Save: " .. enabledString)
end, {
	desc = "Toggle autoformat-on-save globally",
})
