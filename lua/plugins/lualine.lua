return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				-- theme = "dracula",
				theme = "catppuccin",
			},
			sections = {
				lualine_a = {
					{
						"mode",
					},
				},
				lualine_c = {
					{
						"filename",
						path = 1,
					},
				},
				-- lualine_a = {
				-- {
				-- 	"buffers",
				-- 	show_filename_only = true, -- Shows shortened relative path when set to false.
				-- 	hide_filename_extension = false, -- Hide filename extension when set to true.
				-- 	show_modified_status = true, -- Shows indicator when the buffer is modified.
				--
				-- 	mode = 4, -- 0: Shows buffer name
				-- 	-- 1: Shows buffer index
				-- 	-- 2: Shows buffer name + buffer index
				-- 	-- 3: Shows buffer number
				-- 	-- 4: Shows buffer name + buffer number
				--
				-- 	max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,
				-- 	-- it can also be a function that returns
				-- 	-- the value of `max_length` dynamically.
				--
				-- 	filetype_names = {
				-- 		TelescopePrompt = "Telescope",
				-- 		dashboard = "Dashboard",
				-- 		packer = "Packer",
				-- 		fzf = "FZF",
				-- 		alpha = "Alpha",
				-- 	},
				--
				-- 	symbols = {
				-- 		modified = " ●", -- Text to show when the buffer is modified
				-- 		alternate_file = "#", -- Text to show to identify the alternate file
				-- 		directory = "", -- Text to show when the buffer is a directory
				-- 	},
				-- },
				--},
			},
		})
	end,
}
