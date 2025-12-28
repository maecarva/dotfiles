return {
	'stevearc/conform.nvim',
	opts = {
		formatters_by_ft = {
			go = { "goimports" },
			rust = { "leptosfmt", "rustfmt" },
			zig = { "zigfmt" },
			php = { "php_cs_fixer" },
			html = { "prettierd" },
			javascript = { "prettierd", "prettier" },
			typescript = { "prettierd", "prettier" },
			javascriptreact = { "prettierd", "prettier" },
			typescriptreact = { "prettierd", "prettier" },
			json = { "prettierd", "prettier" },
			yaml = { "prettierd", "prettier" },
			markdown = { "prettierd", "prettier" },
			css = { "prettierd", "prettier" },
			cpp = { "clang-format" },
			c = { "clang-format" },
			python = { "black" },
			sql = { "pg_format" },
		},
		format_on_save = {
			timeout_ms = 5000,
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
