return {
	'stevearc/conform.nvim',
	opts = {
		formatters_by_ft = {
			go = { "goimports" },
			rust = { "rustfmt" },
			zig = { "zigfmt" },
			c = {},
			cpp = {},
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = false,
		},
	},
}
