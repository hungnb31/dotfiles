-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
	-- first key is the mode
	n = {
		-- second key is the lefthand side of the map
		-- mappings seen under group name "Buffer"
		["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
		["<leader>bD"] = {
			function()
				require("astronvim.utils.status").heirline.buffer_picker(function(bufnr)
					require("astronvim.utils.buffer").close(
						bufnr)
				end)
			end,
			desc = "Pick to close",
		},
		-- tables with the `name` key will be registered with which-key if it's installed
		-- this is useful for naming menus
		["<leader>b"] = { name = "Buffers" },
		-- quick save
		-- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
		["<leader>h"] = {
			function()
				vim.lsp.buf.hover()
			end,
			desc = "LSP Hover",
		},
		["<leader>q"] = { "<cmd> :q <CR>", desc = "Quit" },
		["<leader>w"] = { "<cmd> :w <CR>", desc = "Save" },
		["<leader>sl"] = { "<cmd> :vsplit <CR>", desc = "Vertical Split" },
		["<leader>sj"] = { "<cmd> :split <CR>", desc = "Horizontal Split" },
		-- Ranger
		["<leader>r"] = { "<cmd> :RnvimrToggle <CR>", desc = "Ranger" },
		-- NeoTree
		["<leader>ef"] = { "<cmd> :Neotree focus <CR>", desc = "Focus Explorer" },
		["<leader>ee"] = { "<cmd> :Neotree toggle <CR>", desc = "Toggle Explorer" },
		-- LSP
		["<leader>lj"] = {
			function()
				vim.diagnostic.goto_next()
			end,
			desc = "LSP Next Diagnostic",
		},
		["<leader>lk"] = {
			function()
				vim.diagnostic.goto_prev()
			end,
			desc = "LSP Prev Diagnostic",
		},
		["J"] = { "jjjjj", desc = "Quick Down" },
		["K"] = { "kkkkk", desc = "Quick Up" },
	},
	v = {
		["J"] = { "jjjjj", desc = "Quick Down" },
		["K"] = { "kkkkk", desc = "Quick Up" },
	},
	t = {
		-- setting a mapping to false will disable it
		["<esc>"] = false,
		["jk"] = false,
		["jj"] = false
	},
	i = {
		["<Tab>"] = { 'copilot#Accept("<CR>")', silent = true, expr = true, noremap = true, replace_keycodes = false },
		["<S-Tab>"] = { 'copilot#Next()', silent = true, expr = true },
		["<C-Tab>"] = { 'copilot#Previous()', silent = true, expr = true },
	},
}
