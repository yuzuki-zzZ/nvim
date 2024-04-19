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
			filesystem = {
				follow_current_file = {
					enabled = true,
				},
				window = {
					mappings = {
						["<CR>"] = function(state)
							require("neo-tree.sources.filesystem.commands").open(state)
							require("neo-tree").close_all()
						end,
						["S"] = function(state)
							require("neo-tree.sources.filesystem.commands").open_vsplit(state)
							require("neo-tree").close_all()
						end,
						["<Leader><Space>"] = function(state)
							require("neo-tree.sources.filesystem.commands").open(state)
						end,
					},
				},
			},
			--window = {
			-- mappings = {
			--  ["<leader>"] = {"toggle_node", nowait = false}
			--}
			--}
		})
		vim.keymap.set("n", "<leader>n", ":Neotree filesystem reveal left<CR>", {})
	end,
}
