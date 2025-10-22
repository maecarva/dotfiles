return {
	'numToStr/Comment.nvim',
	config = function()
		local ft = require('Comment.ft')
		ft.set('s', ';%s')
	end,
	opts = {
		-- add any options here
	}
}
