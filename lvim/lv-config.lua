vim.cmd[[
  set termguicolors
  set background=dark
  let g:gruvbox_material_background = 'hard'

  let g:rnvimr_enable_picker = 1
  let g:rnvimr_hide_gitignore = 1

  let g:sneak#label = 1
]]

-- Additional Plugins
lvim.plugins = {
    {"sainnhe/gruvbox-material"},
    {"christianchiarulli/nvcode-color-schemes.vim"},
    {
        "ray-x/lsp_signature.nvim",
        config = function() require"lsp_signature".on_attach() end,
        event = "InsertEnter"
    },
    {"kevinhwang91/rnvimr"},
    {"justinmk/vim-sneak"},
}

-- Additional Leader bindings for WhichKey
lvim.builtin.which_key.mappings["s"] = {
  name = "Split",
  j = { ":split<cr>", "Horizontal Split" },
  l = { ":vsplit<cr>", "Vertical Split" },
}
lvim.builtin.which_key.mappings["f"] = {
  name = "Find",
  b = { "<cmd>Telescope git_branches<cr>", "Checkout Branch" },
  c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
  f = { "<cmd>Telescope find_files<cr>", "Find File" },
  h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
  M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
  r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
  R = { "<cmd>Telescope registers<cr>", "Registers" },
  t = { "<cmd>Telescope live_grep<cr>", "Text" },
  k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
  C = { "<cmd>Telescope commands<cr>", "Commands" },
  p = {
    "<cmd>lua require('telescope.builtin.internal').colorscheme({enable_preview = true})<cr>",
    "Colorscheme with Preview",
  },
}

lvim.builtin.which_key.mappings["r"] = {
  ":RnvimrToggle<cr>", "Ranger"
}

-- nvim settings
vim.opt.relativenumber = true

-- general
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.colorscheme = "gruvbox-material"

-- keymappings
lvim.leader = "space"

require("utils").add_keymap_normal_mode({ silent = true }, {
  { "J", "jjjjj" },
  { "K", "kkkkk" },
})

-- dashboard setting
lvim.builtin.dashboard.custom_header = {
  "                                                   ",
  "                                                   ",
  "                                                   ",
  "██╗  ██╗ ██████╗ ██╗    ██╗ █████╗ ██████╗ ██████╗ ",
  "██║  ██║██╔═══██╗██║    ██║██╔══██╗██╔══██╗██╔══██╗",
  "███████║██║   ██║██║ █╗ ██║███████║██████╔╝██║  ██║",
  "██╔══██║██║   ██║██║███╗██║██╔══██║██╔══██╗██║  ██║",
  "██║  ██║╚██████╔╝╚███╔███╔╝██║  ██║██║  ██║██████╔╝",
  "╚═╝  ╚═╝ ╚═════╝  ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ ",
}

lvim.builtin.dashboard.footer = { "Howard Carter" }

-- tailwindcss
lvim.lang.tailwindcss.active = true

-- indentation
vim.opt.cindent = true

vim.api.nvim_set_keymap("i", "<C-h>", "compe#complete()", { noremap = true, silent = true, expr = true })
vim.cmd "nnoremap <silent> <C-i> :lua vim.lsp.buf.hover()<CR>"

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
