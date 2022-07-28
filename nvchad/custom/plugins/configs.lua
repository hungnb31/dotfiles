local M = {}

M.treesitter = {
  ensure_installed = {
    "lua",
    "html",
    "css",
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "emmet-ls",
    "json-lsp",

    -- shell
    "shfmt",
    "shellcheck",
  },
}

-- we use a function here as we are calling a moodule (cmp)
-- so the function needs to return a table!
M.cmp = function()
  local cmp = require "cmp"

  return {
    ["<C-d>"] = cmp.mapping.scroll_docs(-8),
  }
end

return M
