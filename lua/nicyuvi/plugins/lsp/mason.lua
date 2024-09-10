-- import mason plugin safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

-- import mason-lspconfig plugin safely
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

-- import mason-null-ls plugin safely
local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

-- enable mason
mason.setup()

mason_lspconfig.setup({
	-- list of servers for mason to install
	ensure_installed = {
		"ts_ls",
		"html",
		"cssls",
		"tailwindcss",
		"lua_ls",
		"emmet_ls",
		"cssmodules_ls",
		"eslint",
		"jsonls",
		"marksman",
		"sqlls",
		"svelte",
		"volar", -- Vue
		"pyright", -- python lsp
		"taplo",
		"clangd", -- C, C++, etc.
	},
	-- auto-install configured servers (with lspconfig)
	automatic_installation = true, -- not the same as ensure_installed
})

mason_null_ls.setup({
	-- list of formatters & linters for mason to install
	ensure_installed = {
		"prettierd", -- js/ts/css/html ect. formatter
		"stylua", -- lua formatter
		"eslint_d", -- ts/js linter
		"flake8", -- python linter
		"black", -- python formatter
		"isort", -- python import sorter since black doesn't do this
		"djlint", -- django template linter and formatter
		"sql-formatter", -- sql formatter
		"clang_format", -- C, C++ formatter
	},
	-- auto-install configured formatters & linters (with null-ls)
	automatic_installation = true,
})
