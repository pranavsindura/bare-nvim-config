local languages = require("config.languages")

return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",

    config = function()
      local ts = require("nvim-treesitter")
      local installing = {}

      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          local ft = vim.bo[args.buf].filetype
          local config = languages.filetypes[ft]

          -- Ignore filetypes not listed in our registry.
          if not config or not config.parser then
            return
          end

          local parser = config.parser
          local buf = args.buf

          local function start_highlighting()
            if not vim.api.nvim_buf_is_valid(buf) then
              return false
            end

            return pcall(vim.treesitter.start, buf, parser)
          end

          if start_highlighting() then
            return
          end

          -- Start installation only once per parser.
          if not installing[parser] then
            installing[parser] = true

            local ok, err = pcall(function()
              ts.install({ parser })
            end)

            if not ok then
              installing[parser] = nil
              vim.notify(
                "Treesitter installation failed: " .. tostring(err),
                vim.log.levels.ERROR
              )
              return
            end

            vim.notify(
              "Installing Treesitter parser: " .. parser,
              vim.log.levels.INFO
            )
          end

          -- Wait for the asynchronous installation to finish.
          local attempts = 0

          local function retry()
            attempts = attempts + 1

            if start_highlighting() then
              installing[parser] = nil
              return
            end

            if attempts >= 600 then
              installing[parser] = nil
              vim.notify(
                "Parser installation timed out: " .. parser,
                vim.log.levels.WARN
              )
              return
            end

            vim.defer_fn(retry, 500)
          end

          vim.defer_fn(retry, 500)
        end,
      })
    end,
  },
}
