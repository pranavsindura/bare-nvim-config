local languages = require("config.languages")

local formatters_by_ft = {}

for ft, config in pairs(languages.filetypes) do
  if config.formatter then
    formatters_by_ft[ft] = config.formatter
  end
end

return {
  {
    "stevearc/conform.nvim",

    event = { "BufWritePre" },

    cmd = { "ConformInfo", "Format" },

    keys = {
      {
        "<leader>lf",
        function()
          require("conform").format({
            async = true,
            lsp_format = "fallback",
          })
        end,
        desc = "Format buffer",
      },
    },

    opts = {
      formatters_by_ft = formatters_by_ft,

      format_on_save = {
        timeout_ms = 2000,
        lsp_format = "fallback",
      },
    },

    config = function(_, opts)
      require("conform").setup(opts)

      vim.api.nvim_create_user_command("Format", function()
        require("conform").format({
          async = true,
          lsp_format = "fallback",
        })
      end, {
        desc = "Format current buffer",
      })
    end,
  },
}
