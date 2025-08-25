return {
	'stevearc/conform.nvim',
	opts = {
		formatters_by_ft = {
			go = { "goimports" },
			rust = { "rustfmt" },
			zig = { "zigfmt" },
			python = { "isort", "black" },
			c = {},
			cpp = {},
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = false,
		},
		formatters = {
			rustfmt = {
				prepend_args = { "--config", "hard_tabs=true", "--config", "tab_spaces=4" },
			},
		},
	},
}
