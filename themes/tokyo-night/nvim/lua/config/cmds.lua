-- Set tab to 2 spaces
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Keep visual mode after indenting
vim.cmd("vnoremap < <gv")
vim.cmd("vnoremap > >gv")

-- Set colorscheme
vim.cmd("colorscheme tokyonight")
