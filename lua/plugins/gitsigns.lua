return {
  "lewis6991/gitsigns.nvim",
  opts = {
    max_file_length = 40000,
    update_debounce = 200,
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

      -- Actions (Wrapped in anonymous functions to prevent internal API crashes)
      map("n", "<leader>gr", function() gitsigns.reset_hunk() end, { desc = "git [r]eset hunk" })
      map("n", "<leader>gR", function() gitsigns.reset_buffer() end, { desc = "git [R]eset buffer" })
      map("n", "<leader>gb", function() gitsigns.blame_line() end, { desc = "git [b]lame line" })
    end,
  }
}
