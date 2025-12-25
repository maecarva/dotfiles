return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
		parser_config.c3 = {
			install_info = {
				url = "https://github.com/c3lang/tree-sitter-c3",
				files = { "src/parser.c", "src/scanner.c" },
				branch = "main",
			},
			filetype = "c3",
		}

		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = {
				"lua", "c", "cpp", "rust", "html", "javascript", "typescript", "go", "zig", "templ"
			},
			highlight = { enable = true },
			indent = { enable = true },

		})
	end
}
