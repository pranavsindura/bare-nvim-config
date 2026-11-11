local languages = require("config.languages")

local linters_by_ft = {}

for ft, config in pairs(languages.filetypes) do
  if config.linter then
    linters_by_ft[ft] = config.linter
  end
end

return {
  {
    "mfussenegger/nvim-lint",

    event = {
      "BufReadPost",
      "BufNewFile",
    },

    config = function()
      local lint = require("lint")

      lint.linters_by_ft = linters_by_ft

      vim.api.nvim_create_user_command("Lint", function()
        lint.try_lint()
      end, {
        desc = "Run linters for current file",
      })

      vim.api.nvim_create_autocmd("BufWritePost", {
        callback = function()
          lint.try_lint()
        end,
        desc = "Run linters after saving",
      })
    end,
  },
}
