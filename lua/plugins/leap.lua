return {
	"ggandor/leap.nvim",
	enabled = true,
	opts = {
		special_keys = {
			next_target = "<enter>",
			prev_target = "<tab>",
			next_group = "<space>",
			prev_group = "<tab>",
		},
	},
	config = function(_, opts)
		vim.keymap.set("n", "s", "<Plug>(leap)")
		vim.keymap.set("n", "S", "<Plug>(leap-from-window)")
		vim.keymap.set({ "x", "o" }, "s", "<Plug>(leap-forward)")
		vim.keymap.set({ "x", "o" }, "S", "<Plug>(leap-backward)")
		require("leap").setup(opts)
	end,
}
