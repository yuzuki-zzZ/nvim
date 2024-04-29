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

			local actions = require("telescope.actions")
			local action_state = require("telescope.actions.state")
			require("telescope").setup({
				defaults = {
					layout_config = {
						horizontal = {
							width = 0.99999,
						},
						vertical = {
							width = 0.80,
						},
					},
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
				pickers = {
					buffers = {
						mappings = {
							n = {
								["<leader>do"] = function(prompt_bufnr)
									local picker = action_state.get_current_picker(prompt_bufnr)
									local selected_entries = picker:get_multi_selection()

									if #selected_entries == 0 then
										-- Fallback to single entry delete if nothing is explicitly selected
										local entry = action_state.get_selected_entry()
										if entry then
											selected_entries = { entry }
										end
									end

									-- actions.close(prompt_bufnr)
									for _, entry in ipairs(selected_entries) do
										pcall(vim.api.nvim_buf_delete, entry.bufnr, { force = true })
									end

									-- Trigger refresh
									actions.close(prompt_bufnr)
									vim.defer_fn(function()
										require("telescope.builtin").buffers()
									end, 50)
								end,
							},
						},
					},
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
