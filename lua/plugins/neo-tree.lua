return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			sources = {
				"filesystem", -- Assuming 'filesystem' is already a source
				"buffers",
				"document_symbols",
				"git_status",
			},
			window = {
				mappings = {
					["Y"] = {
						function(state)
							local node = state.tree:get_node()
							local path = node:get_id()
							vim.fn.setreg("+", path, "c")
						end,
						desc = "Copy Path to Clipboard",
					},
					["O"] = {
						function(state)
							require("lazy.util").open(state.tree:get_node().path, { system = true })
						end,
						desc = "Open with System Application",
					},
				},
			},
			deactivate = function()
				vim.cmd([[Neotree close]])
			end,
			filesystem = {
				follow_current_file = {
					enabled = true,
				},
				use_libuv_file_watcher = true,
				window = {
					mappings = {
						["<CR>"] = function(state)
							require("neo-tree.sources.filesystem.commands").open(state)
              require("neo-tree").close_all()
						end,
						["s"] = function(state)
							require("neo-tree.sources.filesystem.commands").open_vsplit(state)
              require("neo-tree").close_all()
						end,
						-- ["S"] = function(state)
						-- 	require("neo-tree.sources.filesystem.commands").open_vsplit(state)
						-- end,
						["<Leader><Space>"] = function(state)
							require("neo-tree.sources.filesystem.commands").open(state)
						end,
					},
				},
			},
		})
		vim.keymap.set("n", "<leader>n", ":Neotree filesystem reveal left<CR>", {})
		vim.keymap.set("n", "<leader>dn", ":Neotree close<CR>", {})
	end,
}
