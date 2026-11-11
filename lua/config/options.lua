local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.mouse = "a"

opt.clipboard = "unnamedplus"

opt.breakindent = true

opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2

opt.ignorecase = true
opt.smartcase = true

opt.signcolumn = "yes"
opt.updatetime = 250
opt.timeoutlen = 500

opt.splitright = true
opt.splitbelow = true

opt.inccommand = "split"
opt.cursorline = true

opt.hlsearch = true
opt.incsearch = true

opt.fillchars = { diff = "╱" }
opt.diffopt = "internal,filler,closeoff,linematch:60,iwhite,vertical,indent-heuristic,algorithm:histogram"

opt.termguicolors = true
opt.scrolloff = 8
opt.undofile = true
