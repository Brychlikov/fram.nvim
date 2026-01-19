local M = {}

function M.setup()
	-- Filetype detection
	vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
		pattern = "*.fram",
		callback = function()
			vim.bo.filetype = "fram"
		end,
	})

	-- Register the tree-sitter grammar for :TSInstall support
	local parsers = require("nvim-treesitter.parsers")
	parsers.fram = {
		install_info = {
			url = "https://github.com/fram-lang/tree-sitter-fram",
			revision = "09778b3022183a4ff83031830feda26311f0c9ec",
		},
		filetype = "fram",
		tier = 3,
	}
end

return M
