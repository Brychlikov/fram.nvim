local M = {}

function M.setup()
	-- Filetype detection
	vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
		pattern = "*.fram",
		callback = function()
			vim.bo.filetype = "fram"
		end,
	})

	-- Register the external tree-sitter grammar
	local ts_parsers = require("nvim-treesitter.parsers").get_parser_configs()
	ts_parsers.fram = {
		install_info = {
			url = "https://github.com/Brychlikov/tree-sitter-fram",
			revision = "e8d8dcc70a276df49447e5b4384a4f61444afe9a",
			files = { "src/parser.c", "src/scanner.c" },
			branch = "main",
			generate_requires_npm = false,
			requires_generate_from_grammar = false,
		},
		filetype = "fram",
	}

	vim.api.nvim_create_autocmd("Filetype", {
		pattern = "fram",
		callback = function()
			local root_dir = vim.fs.dirname(vim.fs.find({ ".git" }, { upward = true })[1])
			local client = vim.lsp.start({
				name = "framls",
				cmd = { "framls" },
				root_dir = root_dir,
			})
			vim.lsp.buf_attach_client(0, client)
		end,
	})
end

return M
