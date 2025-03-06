-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    -- or                            , branch = '0.1.x',
    requires = { {
      "nvim-lua/plenary.nvim",
      -- "nvim-telescope/telescope-ui-select.nvim",
    } },
  })

  -- use({ "ellisonleao/gruvbox.nvim", as = "gruvbox" })
  use({ "marko-cerovac/material.nvim" })

  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })

  use({
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter",
  })

  -- use("nvim-treesitter/playground")

  -- use("mbbill/undotree")

  use("tpope/vim-fugitive")

  -- use("folke/neodev.nvim")

  use({ "jose-elias-alvarez/null-ls.nvim" })
  use({ "VonHeikemen/lsp-zero.nvim", branch = "v4.x" })
  use({ "neovim/nvim-lspconfig" })
  use({ "hrsh7th/nvim-cmp" })
  use({ "hrsh7th/cmp-path" })
  use({ "hrsh7th/cmp-nvim-lsp" })
  use({
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  })
  use("stevearc/conform.nvim")
  use("mfussenegger/nvim-lint")

  use({
    "numToStr/Comment.nvim",
    requires = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
  })

  use({ "windwp/nvim-autopairs", requires = "hrsh7th/nvim-cmp" })

  use({
    "windwp/nvim-ts-autotag",
    requires = "nvim-treesitter/nvim-treesitter",
  })

  use("JoosepAlviste/nvim-ts-context-commentstring")

  use("kylechui/nvim-surround")

  use("smoka7/hop.nvim")

  use("lewis6991/gitsigns.nvim")

  use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })

  use("echasnovski/mini.splitjoin")
  use("echasnovski/mini.ai")

  use({ "stevearc/oil.nvim" })

  use({ "max397574/better-escape.nvim" })
end)
