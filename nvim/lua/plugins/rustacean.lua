return {
	'mrcjkb/rustaceanvim',
	version = '^5',
	lazy = false,
	config = function()
		vim.g.rustaceanvim = {
			server = {
				default_settings = {
					['rust-analyzer'] = {
						procMacro = {
							ignored = {
								leptos_macro = {
									-- "component",
									"server",
								},
							},
						},
						cargo = {
							features = "all",
						},
					},
				},
			},
		}
	end
}
