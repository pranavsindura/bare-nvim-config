return {
  servers = {
    lua_ls = {
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",
          },
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME,
            },
          },
          telemetry = {
            enable = false,
          },
        },
      },
    },

    ts_ls = {},
  },

  filetypes = {
    lua = {
      parser = "lua",
      server = "lua_ls",
      formatter = { "stylua" },
    },

    cs = {
      parser = "c_sharp"
    },

    javascript = {
      parser = "javascript",
      server = "ts_ls",
      formatter = { "prettierd", "prettier" },
      linter = { "eslint" },
    },

    javascriptreact = {
      parser = "javascript",
      server = "ts_ls",
      formatter = { "prettierd", "prettier" },
      linter = { "eslint" },
    },

    typescript = {
      parser = "typescript",
      server = "ts_ls",
      formatter = { "prettierd", "prettier" },
      linter = { "eslint" },
    },

    typescriptreact = {
      parser = "tsx",
      server = "ts_ls",
      formatter = { "prettierd", "prettier" },
      linter = { "eslint" },
    },

    json = {
      parser = "json",
      formatter = { "prettierd", "prettier" },
    },

    jsonc = {
      parser = "json",
      formatter = { "prettierd", "prettier" },
    },

    markdown = {
      parser = "markdown",
      formatter = { "prettierd", "prettier" },
    },

    html = {
      parser = "html",
      formatter = { "prettierd", "prettier" },
    },

    css = {
      parser = "css",
      formatter = { "prettierd", "prettier" },
    },

    scss = {
      parser = "scss",
      formatter = { "prettierd", "prettier" },
    },

    c = {
      parser = "c",
      formatter = { "clang_format" },
    },

    cpp = {
      parser = "cpp",
      formatter = { "clang_format" },
    },

    rust = {
      parser = "rust",
      formatter = { "rustfmt" },
    },

    python = {
      parser = "python",
      formatter = { "black" },
    },

    sh = {
      parser = "bash",
    },

    zsh = {
      parser = "bash",
    },
  },
}
