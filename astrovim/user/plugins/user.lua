return {
  { "rcarriga/nvim-notify", enabled = false },
  {
    "sainnhe/gruvbox-material",
    init = function()
      vim.g.gruvbox_material_background = "hard"
    end,
  },
  {
    "jose-elias-alvarez/typescript.nvim",
    after = "mason-lspconfig.nvim",
    config = function() require("typescript").setup { server = astronvim.lsp.server_settings "tsserver" } end,
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
}
