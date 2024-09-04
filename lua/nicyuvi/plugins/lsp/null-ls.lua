-- import null-ls plugin safely
local setup, null_ls = pcall(require, "null-ls")
if not setup then
	return
end

-- for conciseness
local formatting = null_ls.builtins.formatting -- to setup formatters
local diagnostics = null_ls.builtins.diagnostics -- to setup linters

-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- configure null_ls
null_ls.setup({
	-- setup formatters & linters
	sources = {
		--  to disable file types use
		--  "formatting.prettierd.with({disabled_filetypes = {}})" (see null-ls docs)
		formatting.prettierd, -- js/ts/css/html ect. formatter
		formatting.stylua, -- lua formatter
    require("none-ls.diagnostics.eslint_d"),
		diagnostics.flake8, -- python linter
		formatting.black, -- python formatter
		formatting.isort, -- python import formatter
		formatting.djlint, -- django template formatter
		diagnostics.djlint, -- django template linter
		formatting.sql_formatter, -- sql formatter
		formatting.taplo, -- toml formatter
	},

	-- configure format on save
	on_attach = function(current_client, bufnr)
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client)
							--  only use null-ls for formatting instead of lsp server
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
					})
				end,
			})
		end
	end,
})
