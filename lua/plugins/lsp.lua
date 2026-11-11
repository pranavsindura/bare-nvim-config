local languages = require("config.languages")

local servers = vim.tbl_keys(languages.servers)
table.sort(servers)

return {
  {
    "mason-org/mason-lspconfig.nvim",

    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = {},
      },
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
    },

    config = function()
      local capabilities =
          require("cmp_nvim_lsp").default_capabilities()

      -- Configure each language server before enabling it.
      for name, config in pairs(languages.servers) do
        config.capabilities = capabilities
        vim.lsp.config(name, config)
      end

      require("mason-lspconfig").setup({
        ensure_installed = servers,
        automatic_enable = servers,
      })

      -- LSP keymaps, scoped to buffers with an attached server.
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
          local opts = {
            buffer = event.buf,
            silent = true,
          }

          local map = function(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, {
              buffer = opts.buffer,
              silent = true,
              desc = desc,
            })
          end

          map("K", vim.lsp.buf.hover, "Hover documentation")
          map("gd", vim.lsp.buf.definition, "Go to definition")
          map("gD", vim.lsp.buf.declaration, "Go to declaration")
          map("gi", vim.lsp.buf.implementation, "Go to implementation")
          map("gr", vim.lsp.buf.references, "Find references")

          map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
          map("<leader>ca", vim.lsp.buf.code_action, "Code action")
        end,
      })

      vim.diagnostic.config({
        severity_sort = true,
        virtual_text = true,
        float = {
          border = "rounded",
        },
      })
    end,
  },
}
