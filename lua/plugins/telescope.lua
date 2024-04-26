return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			"sk1418/QFGrep",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
			},
		},
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
			vim.keymap.set("n", "<leader>fl", builtin.builtin, {})
      vim.keymap.set("n", "<leader>fc", builtin.git_status, {})
			vim.keymap.set("n", "gi", builtin.lsp_implementations, {})
			vim.keymap.set("n", "gd", builtin.lsp_definitions, {})
			vim.keymap.set("n", "gr", builtin.lsp_references, {})

			 vim.keymap.set("n", "<leader>gg", "<Plug>QFGrepG", {})
			 vim.keymap.set("n", "<leader>gv", "<Plug>QFGrepV", {})
			 vim.keymap.set("n", "<leader>gr", "<Plug>QFRestore", {})

			require("telescope").setup({
				defaults = {
          mappings = {
            n = {
              ["<leader>s"] = require("telescope.actions").file_vsplit,
            },
          },
					path_display = function(opts, path)
						local tail = require("telescope.utils").path_tail(path)
						return string.format("%s (%s)", tail, path)
					end,
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({
							-- even more opts
						}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
			require("telescope").load_extension("fzf")
		end,
	},
}
