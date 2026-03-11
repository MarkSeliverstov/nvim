return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		require("dapui").setup()

		local dap, dapui = require("dap"), require("dapui")

		dap.adapters.python = {
			type = "executable",
			command = os.getenv("HOME") .. "/.local/share/nvim/mason/packages/debugpy/venv/bin/python",
			args = { "-m", "debugpy.adapter" },
		}
		dap.configurations.python = {
			{
				-- The first three options are required by nvim-dap
				type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
				request = "launch",
				name = "Launch file",

				-- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options
				program = "${file}", -- This configuration will launch the current file if used.
				pythonPath = function()
					local env = os.getenv("VIRTUAL_ENV")
					local cwd = vim.fn.getcwd()
					if env then
						return env .. "/bin/python"
					elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
						return cwd .. "/.venv/bin/python"
					else
						return "/opt/homebrew/bin/python3.13"
					end
				end,
			},
		}

		vim.keymap.set("n", "<F5>", function()
			require("dap").continue()
		end)
		-- vim.keymap.set("n", "<F10>", function()
		-- 	require("dap").step_over()
		-- end)
		-- vim.keymap.set("n", "<F11>", function()
		-- 	require("dap").step_into()
		-- end)
		-- vim.keymap.set("n", "<F12>", function()
		-- 	require("dap").step_out()
		-- end)
		-- vim.keymap.set("n", "<Leader>B", function()
		-- 	require("dap").toggle_breakpoint()
		-- end)
		-- vim.keymap.set("n", "<Leader>lp", function()
		-- 	require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
		-- end)
		-- vim.keymap.set("n", "<Leader>dr", function()
		-- 	require("dap").repl.open()
		-- end)
		-- vim.keymap.set("n", "<Leader>dl", function()
		-- 	require("dap").run_last()
		-- end)

		vim.keymap.set("n", "<Leader>dt", ":DapToggleBreakpoint<CR>")
		vim.keymap.set("n", "<Leader>dx", ":DapTerminate<CR>")
		vim.keymap.set("n", "<Leader>do", ":DapStepOver<CR>")
		vim.keymap.set("n", "<Leader>di", ":DapStepInto<CR>")
		vim.keymap.set({ "n", "v" }, "<F4>", function()
			require("dapui").eval()
		end)

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end
	end,
}
