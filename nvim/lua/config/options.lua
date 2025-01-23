local opt = vim.opt;

opt.expandtab = true
opt.shiftwidth = 4

-- Needed for feline plugin
--opt.termguicolors = true

vim.wo.number = true
opt.relativenumber = true
opt.termguicolors = true

vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })

opt.fillchars = { fold = " " }
opt.foldmethod = "indent"
opt.foldenable = false
opt.foldlevel = 99
