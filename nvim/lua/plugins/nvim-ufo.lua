return {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async",
    "luukvbaal/statuscol.nvim"
  },
  event = "BufReadPost",
  opts = {
	close_fold_kinds_for_ft = {
        default = {}
    },
    provider_selector = function(bufnr, filetype, buftype)
      return { "treesitter", "indent" }
    end,
  },
  init = function()
    vim.o.foldcolumn = "1"
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
  end,
  config = function(_, opts)
    local ufo = require("ufo")

    vim.keymap.set("n", "zR", ufo.openAllFolds) -- Open all fold
    vim.keymap.set("n", "zM", ufo.closeAllFolds) -- close all fold
    ufo.setup(opts)
  end,
}
