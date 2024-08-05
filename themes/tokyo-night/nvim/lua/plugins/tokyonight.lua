return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
	  style = "moon",
	  transparent = true,
		  erminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
	  styles = {
		    -- Style to be applied to different syntax groups
		    -- Value is any valid attr-list value for `:help nvim_set_hl`
		    comments = { italic = true },
		    keywords = { italic = true },
		    functions = {},
		    variables = {},
		    -- Background styles. Can be "dark", "transparent" or "normal"
		    sidebars = "dark", -- style for sidebars, see below
		    floats = "dark", -- style for floating windows
	  },
	  lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold
  },
}
