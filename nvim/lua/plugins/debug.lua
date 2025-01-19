return {
	{
			"mfussenegger/nvim-dap",
			dependencies = {
					"rcarriga/nvim-dap-ui",
					"leoluz/nvim-dap-go",
					"nvim-neotest/nvim-nio"
			},
			config = function()
					local dap, dapui = require("dap"), require("dapui")

					require("dapui").setup()
					require("dap-go").setup()


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

					vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, {})
					vim.keymap.set("n", "<leader>ds", dap.continue, {})
					vim.keymap.set("n", "<leader>dn", dap.step_over, {})
					vim.keymap.set("n", "<leader>du", dapui.toggle, {})
					vim.keymap.set("n", "<leader>dr", ":lua require('dapui').open({reset = true})<CR>", {})
					

					vim.fn.sign_define("DapBreakpoint", {text = "🔴", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl="DapBreakpoint"})
			end,
	}
}