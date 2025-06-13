return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "clangd" }
			})
		end
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
        config = function()
            require("mason-nvim-dap").setup({
                ensure_installed = { "cpptools" },
                automatic_setup = true,
            })
        end
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require('cmp_nvim_lsp').default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.clangd.setup({
				capabilities = require('cmp_nvim_lsp').default_capabilities(),
				cmd = { "clangd", "--background-index", "--clang-tidy" },
				root_dir = require("lspconfig.util").root_pattern("compile_commands.json", ".git"),
			})
			lspconfig.lua_ls.setup({
			 	capabilities = capabilities
			})
			lspconfig.gopls.setup({
			 	capabilities = capabilities
			})
			lspconfig.zls.setup({
			 	capabilities = capabilities
			})

			vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
			vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
		end
	}
}
