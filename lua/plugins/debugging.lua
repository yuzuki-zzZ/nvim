return {
	{
		"mfussenegger/nvim-dap",
		dependencies = { "rcarriga/nvim-dap-ui", "nvim-neotest/nvim-nio", "mfussenegger/nvim-dap-python" },
		lazy = false,
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()

			require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")

			vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, {})
			vim.keymap.set("n", "<Leader>dc", dap.continue, {})

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
		end,
	},
	{
		"jbyuki/one-small-step-for-vimkind",
		config = function()
			local dap = require("dap")
			dap.configurations.lua = {
				{
					type = "nlua",
					request = "attach",
					name = "Attach to running Neovim instance",
				},
			}

			dap.adapters.nlua = function(callback, config)
				callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or 8086 })
			end

			vim.api.nvim_set_keymap("n", "<F5>", [[:lua require("osv").launch({port = 8086})<CR>]], { noremap = true })
		end,
	},
}
