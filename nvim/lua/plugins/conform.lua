return {
	'stevearc/conform.nvim',
	opts = {
		formatters_by_ft = {
			go = { "goimports" },
			rust = { "rustfmt" },
			zig = { "zigfmt" },
			php = { "php_cs_fixer" },
			html = { "prettier" },
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
			php_cs_fixer = {
				command = "php-cs-fixer",
				args = { "fix", "--using-cache=no", "--quiet", "$FILENAME" },
				stdin = false,
			},
		},
	},
}
