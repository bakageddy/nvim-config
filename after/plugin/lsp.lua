---@diagnostic disable
local lsp = require("lsp-zero")
local cmp = require("cmp")
local snip = require("luasnip")

lsp.preset("recommended")

lsp.ensure_installed({
	"rust_analyzer",
	"clangd",
	"gopls",
	"jdtls",
})

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

lsp.preset({
	manage_nvim_cmp = {
		set_sources = 'lsp',
		set_basic_mappings = true,
		set_extra_mappings = true,
		use_luasnip = true,
		set_format = true,
		documentation_window = true,
	}
})


local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_prev_item()
		elseif snip.jumpable(-1) then
			snip.jump(-1)
		else
			fallback()
		end
	end, { "i", "s" }),
	['<C-n>'] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_next_item()
		elseif snip.expand_or_jumpable() then
			snip.expand_or_jump()
		elseif has_words_before() then
			cmp.complete()
		else
			fallback()
		end
	end, { "i", "s" }),
	['<C-y>'] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.confirm()
		elseif snip.expand_or_jumpable() then
			snip.expand_or_jump()
		elseif has_words_before() then
			cmp.complete()
		else
			fallback()
		end
	end, { "i", "s" }),
	['<C-space>'] = cmp.mapping.complete(),
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }
	-- if client.name == "clangd" then
	client.server_capabilities.semanticTokensProvider = true
	client.server_capabilities.signatureHelpProvider = false
	-- end
	-- if client.server_capabilities.inlayHintProvider then
	-- 	vim.lsp.inlay_hint.enable(true)
	-- end

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>ss", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "[e", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "]e", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
	vim.keymap.set("n", "<leader>ff", function()
		vim.lsp.buf.format { async = true }
	end, {})
end)


lsp.nvim_workspace()
lsp.setup()
