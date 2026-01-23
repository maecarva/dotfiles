return {
	'stevearc/conform.nvim',
	opts = {
		formatters_by_ft = {
			-- Web / Nuxt / Vue / React
			vue = { "prettierd", "prettier", stop_after_first = true },
			javascript = { "prettierd", "prettier", stop_after_first = true },
			typescript = { "prettierd", "prettier", stop_after_first = true },
			javascriptreact = { "prettierd", "prettier", stop_after_first = true },
			typescriptreact = { "prettierd", "prettier", stop_after_first = true },
			html = { "prettierd", "prettier", stop_after_first = true },
			css = { "prettierd", "prettier", stop_after_first = true },
			json = { "prettierd", "prettier", stop_after_first = true },
			yaml = { "prettierd", "prettier", stop_after_first = true },
			markdown = { "prettierd", "prettier", stop_after_first = true },

			-- Backend / Systems
			go = { "goimports", "gofmt" },
			rust = { "leptosfmt", "rustfmt", stop_after_first = true },
			zig = { "zigfmt" },
			php = { "php_cs_fixer" },
			python = { "black" },

			-- C / C++ / SQL
			cpp = { "clang-format" },
			c = { "clang-format" },
			sql = { "pg_format" },

			-- ["*"] = { "codespell" }, -- if no formatter
		},

		format_on_save = {
			timeout_ms = 5000,
			lsp_format = "never",
		},

		formatters = {
			rustfmt = {
				prepend_args = { "--config", "hard_tabs=true,tab_spaces=4" },
			},
			prettier = {
				prepend_args = { "--tab-width", "2" },
			}
		},
	},
}
