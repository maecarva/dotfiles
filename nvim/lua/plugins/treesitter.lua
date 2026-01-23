return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				ensure_installed = {
					"lua", "c", "cpp", "rust", "javascript", "typescript", "go", "zig", "templ", "tsx", "html", "css",
					"vue"
				},
				highlight = { enable = true },
				indent = { enable = true },
				fold = { enable = false },

			})
		end
	},
	{
		"rayliwell/tree-sitter-rstml",
		dependencies = { "nvim-treesitter" },
		build = ":TSUpdate",
		config = function()
			require("tree-sitter-rstml").setup()
		end
	},
	{
		"windwp/nvim-ts-autotag",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = function()
			require('nvim-ts-autotag').setup({
				opts = {
					enable_close = true,
					enable_rename = true,
					enable_close_on_slash = false,
				},
				per_filetype = {
					["typescriptreact"] = {
						enable_close = true,
					},
					["javascriptreact"] = {
						enable_close = true,
					},
				}
			})
		end
	}
}
