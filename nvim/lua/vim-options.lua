-- base config
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set relativenumber")
vim.cmd("set number")
vim.cmd("set autoindent")
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"


local function disable_arrows(with_message)
	local rhs = with_message and function()
		vim.notify("Utilise hjkl 👀", vim.log.levels.WARN, { title = "No Arrows" })
	end or "<Nop>"

	for _, key in ipairs({ "<Up>", "<Down>", "<Left>", "<Right>" }) do
		-- Pas de 't' (terminal), ni 'c' (cmdline) par défaut
		vim.keymap.set({ "n", "v", "x", "o", "i", "s" }, key, rhs, {
			noremap = true,
			silent = true,
		})
	end
end

-- État courant
vim.g.no_arrows_enabled = true
disable_arrows(false) -- mets false pour silence total, sans notify
