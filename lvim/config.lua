vim.cmd [[
set rnu
set termguicolors
set background=dark
let g:gruvbox_material_background = 'hard'
let g:sneak#label = 1
]]

-- general
lvim.log.level = "warn"
lvim.colorscheme = "gruvbox-material"
lvim.format_on_save = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

lvim.builtin.which_key.mappings["r"] = {
  ":RnvimrToggle<cr>", "Ranger"
}

lvim.builtin.which_key.mappings["m"] = {
  "*N<cmd>nohlsearch<cr>", "Mark Word"
}

lvim.builtin.which_key.mappings["s"] = {
  name = "Split",
  j = { ":split<cr>", "Horizontal Split" },
  l = { ":vsplit<cr>", "Vertical Split" },
}
lvim.builtin.which_key.mappings["f"] = {
  name = "Find",
  b = { "<cmd>Telescope git_branches<cr>", "Checkout Branch" },
  c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
  f = { "<cmd>Telescope git_files<cr>", "Find Git File" },
  g = { "<cmd>Telescope find_files<cr>", "Find File" },
  h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
  M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
  r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
  R = { "<cmd>Telescope registers<cr>", "Registers" },
  w = { "<cmd>Telescope live_grep<cr>", "Word" },
  k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
  C = { "<cmd>Telescope commands<cr>", "Commands" },
  p = { "<cmd>Telescope projects<cr>", "Projects" },
}

lvim.builtin.which_key.mappings["t"] = {
  name = "Diagnostics",
  t = { "<cmd>TroubleToggle<cr>", "trouble" },
  w = { "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "workspace" },
  d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
}

lvim.builtin.which_key.mappings["e"] = {
  name = "Nvim Tree",
  e = { ":NvimTreeToggle<cr>", "Toggle" },
  f = { ":NvimTreeFindFile<cr>", "Find File" }
}

-- Additional Plugins
lvim.plugins = {
  {
    "nvim-telescope/telescope-project.nvim",
    event = "BufWinEnter",
    setup = function()
      vim.cmd [[packadd telescope.nvim]]
    end,
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
  { "tpope/vim-repeat" },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "tpope/vim-surround",
    keys = { "c", "d", "y" }
  },
  {
    "ggandor/lightspeed.nvim",
    event = "BufRead",
  },
  { "sainnhe/gruvbox-material" },
  {
    "ray-x/lsp_signature.nvim",
    config = function() require "lsp_signature".on_attach() end,
    event = "InsertEnter"
  },
  { "justinmk/vim-sneak" },
}

lvim.keys.normal_mode = {
  ["J"] = "jjjjj",
  ["K"] = "kkkkk",

  -- Navigate buffers
  ["<Tab>"] = ":bnext<CR>",
  ["<S-Tab>"] = ":bprevious<CR>",
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.show_icons.git = 0
lvim.builtin.nvimtree.setup.view.auto_resize = true

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "css",
  "rust",
  "java",
  "yaml",
}

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "black" },
  {
    command = "prettier",
    args = { "--print-width", "100" },
    filetypes = { "typescript", "typescriptreact" },
  },
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- lvim.autocommands.custom_groups = {
--   -- On entering a lua file, set the tab spacing and shift width to 8
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }
