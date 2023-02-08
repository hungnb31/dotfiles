local config = {
		-- Configure AstroNvim updates
		updater = {
				remote = "origin", -- remote to use
				channel = "stable", -- "stable" or "nightly"
				version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
				branch = "main", -- branch name (NIGHTLY ONLY)
				commit = nil, -- commit hash (NIGHTLY ONLY)
				pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
				skip_prompts = false, -- skip prompts about breaking changes
				show_changelog = true, -- show the changelog after performing an update
				-- remotes = { -- easily add new remotes to track
				--   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
				--   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
				--   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
				-- },
		},
		-- Set colorscheme
		colorscheme = "gruvbox-material",
		-- Override highlight groups in any theme
		highlights = {
				default_theme = function(highlights) -- or a function that returns one
					local C = require("default_theme.colors")

					highlights.Normal = { fg = C.fg, bg = C.bg }
					return highlights
				end,
		},
		-- set vim options here (vim.<first_key>.<second_key> =  value)
		options = {
				opt = {
						relativenumber = true, -- sets vim.opt.relativenumber
				},
				g = {
						mapleader = " ", -- sets vim.g.mapleader
						gruvbox_material_background = "hard",
				},
		},
		-- Default theme configuration
		default_theme = {
				diagnostics_style = { italic = true },
				-- Modify the color table
				colors = function(C)
					C.telescope_green = C.green
					C.telescope_red = C.red
					C.telescope_fg = C.fg
					C.telescope_bg = C.black_1
					C.telescope_bg_alt = C.bg_1
					return C
				end,
				highlights = function(hl)
					local C = require("default_theme.colors")
					hl.TelescopeBorder = { fg = C.telescope_bg_alt, bg = C.telescope_bg }
					hl.TelescopeNormal = { bg = C.telescope_bg }
					hl.TelescopePreviewBorder = { fg = C.telescope_bg, bg = C.telescope_bg }
					hl.TelescopePreviewNormal = { bg = C.telescope_bg }
					hl.TelescopePreviewTitle = { fg = C.telescope_bg, bg = C.telescope_green }
					hl.TelescopePromptBorder = { fg = C.telescope_bg_alt, bg = C.telescope_bg_alt }
					hl.TelescopePromptNormal = { fg = C.telescope_fg, bg = C.telescope_bg_alt }
					hl.TelescopePromptPrefix = { fg = C.telescope_red, bg = C.telescope_bg_alt }
					hl.TelescopePromptTitle = { fg = C.telescope_bg, bg = C.telescope_red }
					hl.TelescopeResultsBorder = { fg = C.telescope_bg, bg = C.telescope_bg }
					hl.TelescopeResultsNormal = { bg = C.telescope_bg }
					hl.TelescopeResultsTitle = { fg = C.telescope_bg, bg = C.telescope_bg }
					return hl
				end,
				plugins = { -- enable or disable extra plugin highlighting
						aerial = true,
						beacon = false,
						bufferline = true,
						dashboard = true,
						highlighturl = true,
						hop = false,
						indent_blankline = true,
						better_escape = false,
						lightspeed = true,
						["neo-tree"] = true,
						notify = true,
						stylua = false,
						["nvim-tree"] = false,
						["nvim-web-devicons"] = true,
						rainbow = false,
						symbols_outline = false,
						telescope = true,
						vimwiki = false,
						["which-key"] = true,
				},
		},
		-- Disable AstroNvim ui features
		ui = {
				nui_input = true,
				telescope_select = true,
		},
		-- Configure plugins
		plugins = {
				-- Add plugins, the packer syntax without the "use"
				better_escape = function()
					local better_escape = require("better_escape")

					better_escape.setup({
							mapping = { "kj" }, -- a table with mappings to use
							clear_empty_lines = false, -- clear line after escaping if there is only whitespace
							keys = "<Esc>", -- keys used for escaping, if it is a function will use the result everytime
					})
				end,

				init = {
						-- You can disable default plugins as follows:
						-- ["goolord/alpha-nvim"] = { disable = true },

						-- You can also add new plugins here as well:
						{ "sainnhe/gruvbox-material" },
						{
								"ggandor/lightspeed.nvim",
								event = "BufRead",
						},
						{
								"kevinhwang91/rnvimr",
								cmd = "RnvimrToggle",
								config = function()
									vim.g.rnvimr_pick_enable = 1
									vim.g.rnvimr_bw_enable = 1
									vim.g.rnvimr_hide_gitignore = 1
									vim.g.rnvimr_draw_border = 1
								end,
						},
				},
				-- All other entries override the setup() call for default plugins
				["null-ls"] = function(config)
					local null_ls = require("null-ls")
					-- Check supported formatters and linters
					-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
					-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
					config.sources = {
							-- Set a formatter
							null_ls.builtins.formatting.rufo,
							null_ls.builtins.formatting.prettierd,
							null_ls.builtins.formatting.stylua,
							-- Set a linter
							null_ls.builtins.diagnostics.rubocop,
					}
					-- set up null-ls's on_attach function
					-- config.on_attach = function(client)
					-- 	-- NOTE: You can remove this on attach function to disable format on save
					-- 	if client.resolved_capabilities.document_formatting then
					-- 		vim.api.nvim_create_autocmd("BufWritePre", {
					-- 			desc = "Auto format before save",
					-- 			pattern = "<buffer>",
					-- 			callback = vim.lsp.buf.formatting_sync,
					-- 		})
					-- 	end
					-- end
					return config -- return final config table
				end,
				packer = {
						compile_path = vim.fn.stdpath("data") .. "/packer_compiled.lua",
				},
				["neo-tree"] = {
						window = {
								position = "right",
								width = 35,
						},
				},
		},
		-- LuaSnip Options
		luasnip = {
				-- Add paths for including more VS Code style snippets in luasnip
				vscode_snippet_paths = {},
				-- Extend filetypes
				filetype_extend = {
						javascript = { "javascriptreact" },
				},
		},
		-- Modify which-key registration
		["which-key"] = {
				-- Add bindings
				register_mappings = {
						n = {
								-- second key is the prefix, <leader> prefixes
								["<leader>"] = {
										-- which-key registration table for normal mode, leader prefix
										-- ["N"] = { "<cmd>tabnew<cr>", "New Buffer" },
								},
						},
				},
		},
		-- CMP Source Priorities
		-- modify here the priorities of default cmp sources
		-- higher value == higher priority
		-- The value can also be set to a boolean for disabling default sources:
		-- false == disabled
		-- true == 1000
		cmp = {
				source_priority = {
						nvim_lsp = 1000,
						luasnip = 750,
						buffer = 500,
						path = 250,
				},
		},
		-- Extend LSP configuration
		lsp = {
				-- enable servers that you already have installed without lsp-installer
				servers = {
						-- "pyright"
				},
				-- easily add or disable built in mappings added during LSP attaching
				mappings = {
						n = {
								-- ["<leader>lf"] = false -- disable formatting keymap
								["K"] = false,
						},
				},
				-- add to the server on_attach function
				-- on_attach = function(client, bufnr)
				-- end,

				-- override the lsp installer server-registration function
				-- server_registration = function(server, opts)
				--   require("lspconfig")[server].setup(opts)
				-- end,

				-- Add overrides for LSP server settings, the keys are the name of the server
				["server-settings"] = {
						-- example for addings schemas to yamlls
						-- yamlls = {
						--   settings = {
						--     yaml = {
						--       schemas = {
						--         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
						--         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
						--         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
						--       },
						--     },
						--   },
						-- },
				},
		},
		-- Diagnostics configuration (for vim.diagnostics.config({}))
		diagnostics = {
				virtual_text = true,
				underline = true,
		},
		mappings = {
				-- first key is the mode
				n = {
						-- second key is the lefthand side of the map
						-- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },
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
				t = {
						-- setting a mapping to false will disable it
						["<esc>"] = false,
						["jk"] = false,
						["N"] = { "<C-\\><C-n>", desc = "Terminal normal mode" },
				},
		},
		-- This function is run last
		-- good place to configuring augroups/autocommands and custom filetypes
		polish = function()
			-- Set key binding
			-- Set autocommands
			vim.api.nvim_create_augroup("packer_conf", { clear = true })
			vim.api.nvim_create_autocmd("BufWritePost", {
					desc = "Sync packer after modifying plugins.lua",
					group = "packer_conf",
					pattern = "plugins.lua",
					command = "source <afile> | PackerSync",
			})
		end,
}

return config
