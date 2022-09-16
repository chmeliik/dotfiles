local opt = vim.opt

opt.shiftwidth = 4            -- number of spaces used for auto-indent
opt.softtabstop = -1          -- <Tab> inserts $shiftwidth spaces
opt.expandtab = true          -- convert tabs to spaces
opt.list = true               -- show characters used for indentation

opt.iskeyword:append("-")     -- treat '-' as part of words

opt.number = true             -- show line numbers
opt.cursorline = true         -- highlight current line
opt.termguicolors = true      -- 24-bit colors
opt.showmode = false          -- shown by status line

opt.splitbelow = true         -- horizontal splits go below current file
opt.splitright = true         -- vertical splits go to the right of current file

opt.clipboard = "unnamedplus" -- use the system clipboard
opt.undofile = true           -- can stil undo after reopening buffer
