return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      'dart', 'go', 'html', 'javascript', 'python',
      'rust', 'typescript'
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true
    },
    indent = {
      enable = true
    }
  }
}
