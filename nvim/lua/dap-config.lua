local dap = require('dap')

dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    command = 'OpenDebugAD7', -- cpptools est installé via Mason
    options = {
        detached = false
    }
}

dap.configurations.c = {
    {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = true,
		args = function()
			local input = vim.fn.input('Programs arguments: ')
			return vim.fn.split(input, " ", true)
		end,
        setupCommands = {
            {
                description = 'Enable pretty-printing for gdb',
                text = '-enable-pretty-printing',
                ignoreFailures = false
            },
        },
    },
}

dap.configurations.cpp = dap.configurations.c

local dapui = require("dapui")

dapui.setup({
  layouts = {
    {
      elements = {
        'scopes',
        'breakpoints',
        'stacks',
        'watches',
      },
      size = 40,
      position = 'left',
    },
    {
      elements = {
        'repl',
        'console',  -- Include the console here
      },
      size = 10,
      position = 'bottom',
    },
  },
})

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

require("nvim-dap-virtual-text").setup()

-- Raccourcis pour nvim-dap
vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function()
    require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))
end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)

vim.keymap.set('n', '<F4>', function() require('dapui').close() end)
