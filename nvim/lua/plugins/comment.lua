return {
	'numToStr/Comment.nvim',
	config = function()
		require('Comment').setup()
	end
}
-- gcc : comment 1 line with //
-- gbc : comment 1 line with /* */
-- [NUM]gcc : comment multiline with //
-- [NUM]gbc : comment multiline with /* */
