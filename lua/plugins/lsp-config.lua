return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "tsserver", "eslint", "pylsp", "tailwindcss", "html", "cssls" },
				automatic_installation = true,
			})
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		config = function()
			require("mason-null-ls").setup({
				automatic_installation = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")

			lspconfig.tsserver.setup({
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
				end,
        root_dir = lspconfig.util.root_pattern(".git"),
				settings = {
					typescript = {
						inlayHints = {
							includeInlayParameterNameHints = "all",
							includeInlayParameterNameHintsWhenArgumentMatchesName = false,
							includeInlayFunctionParameterTypeHints = true,
							includeInlayVariableTypeHints = false,
							includeInlayPropertyDeclarationTypeHints = true,
							includeInlayFunctionLikeReturnTypeHints = false,
							includeInlayEnumMemberValueHints = true,
						},
						suggest = {
							includeCompletionsForModuleExports = true,
						},
					},
					javascript = {
						inlayHints = {
							includeInlayParameterNameHints = "all",
							includeInlayParameterNameHintsWhenArgumentMatchesName = false,
							includeInlayFunctionParameterTypeHints = true,
							includeInlayVariableTypeHints = false,
							includeInlayPropertyDeclarationTypeHints = true,
							includeInlayFunctionLikeReturnTypeHints = false,
							includeInlayEnumMemberValueHints = true,
						},
						suggest = {
							includeCompletionsForModuleExports = true,
						},
					},
				},
			})
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.ruff.setup({
				capabilities = capabilities,
			})
			lspconfig.pylsp.setup({
				capabilities = capabilities,
			})
			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				capabilities = capabilities,
			})
			lspconfig.cssls.setup({
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					client.server_capabilities.documentFormattingProvider = true
					client.server_capabilities.documentRangeFormattingProvider = true
				end,
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, {})
			--vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
			--vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			--vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
