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
				ensure_installed = { "lua_ls", "clangd", "zls", "volar" }
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
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			local capabilities = require('cmp_nvim_lsp').default_capabilities()
			local lspconfig = require("lspconfig")
			local util = require("lspconfig.util")

			-- vue
			local mason_registry = require('mason-registry')
			local vue_language_server_path = mason_registry.get_package('vue-language-server'):get_install_path() ..
				'/node_modules/@vue/language-server'


			lspconfig.clangd.setup({
				capabilities = require('cmp_nvim_lsp').default_capabilities(),
				cmd = { "clangd", "--background-index" },
				root_dir = require('lspconfig').util.root_pattern('.clangd', 'compile_commands.json', '.git', 'Makefile'),
				filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
				on_attach = function(client, _bufnr)
					client.server_capabilities.documentFormattingProvider = false
				end,
			})

			-- vue
			lspconfig.vtsls.setup({
				capabilities = capabilities,
				filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
				settings = {
					vtsls = {
						tsserver = {
							globalPlugins = {
								{
									name = "@vue/typescript-plugin",
									location = vue_language_server_path,
									languages = { "vue" },
									configNamespace = "typescript",
									enableForWorkspaceTypeScriptVersions = true,
								},
							},
						},
					},
				},
			})

			lspconfig.volar.setup({
				capabilities = capabilities,
				root_dir = util.root_pattern("nuxt.config.ts", "nuxt.config.js", "package.json", ".git"),
			})

			lspconfig.tailwindcss.setup({
				capabilities = capabilities
			})
			lspconfig.pyright.setup({
				capabilities = capabilities
			})
			lspconfig.lua_ls.setup({
				capabilities = capabilities
			})
			lspconfig.gopls.setup({
				capabilities = capabilities
			})
			lspconfig.templ.setup({
				capabilities = capabilities
			})
			lspconfig.zls.setup({
				capabilities = capabilities
			})
			lspconfig.postgres_lsp.setup({
				cmd = { vim.fn.expand("~/.local/share/nvim/mason/bin/postgres-language-server") },
				capabilities = capabilities
			})

			vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
			vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
		end
	}
}
