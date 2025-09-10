return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = { "lua", "c", "cpp", "rust", "html", "javascript", "typescript", "svelte", "go", "php", "python", "zig" },
			highlight = { enable = true },
			indent = { enable = true },
		})
	end
}
