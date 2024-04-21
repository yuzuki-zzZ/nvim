return {
	"kevinhwang91/nvim-ufo",
	dependencies = {
		"kevinhwang91/promise-async",
		{
			"luukvbaal/statuscol.nvim",
			opts = function()
				local builtin = require("statuscol.builtin")
				return {
					setopt = true,
					-- override the default list of segments with:
					-- number-less fold indicator, then signs, then line number & separator
					segments = {
						{ text = { builtin.foldfunc }, click = "v:lua.ScFa" },
						{ text = { "%s" }, click = "v:lua.ScSa" },
						{
							text = { builtin.lnumfunc, " " },
							condition = { true, builtin.not_empty },
							click = "v:lua.ScLa",
						},
					},
				}
			end,
		},
	},
	config = function()
		vim.o.foldcolumn = "1" -- '0' is not bad
		vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true
		vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

		-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
		vim.keymap.set("n", "zR", require("ufo").openAllFolds)
		vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

		-- local capabilities = vim.lsp.protocol.make_client_capabilities()
		-- capabilities.textDocument.foldingRange = {
		--   dynamicRegistration = false,
		--   lineFoldingOnly = true,
		-- }
		require("ufo").setup({
			close_fold_kinds_for_ft = {
				typescript = { "imports" },
				typescriptreact = { "imports" },
				["typescrpt.tsx"] = { "imports" },
			},
		})
	end,
}
