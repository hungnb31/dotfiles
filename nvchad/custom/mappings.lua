local M = {}

M.treesitter = {
  n = {
    ["<leader>cu"] = { "<cmd> TSCaptureUnderCursor <CR>", "  find media" },
  },
}

M.split = {
  n = {
    ["<leader>sl"] = { "<cmd> :vsplit <CR>", "Vertical Split" },
    ["<leader>sj"] = { "<cmd> :split <CR>", "Horizontal Split" },
  },
}

M.general = {
  n = {
    ["<leader>q"] = { "<cmd> :q <CR>", "Quit" },
    ["<leader>w"] = { "<cmd> :w <CR>", "Save" },
    ["J"] = { "jjjjj", "Quick Down" },
    ["K"] = { "kkkkk", "Quick Up" },
  },
}

M.nvimtree = {
  n = {
    ["<leader>ee"] = { "<cmd> :NvimTreeToggle <CR>", "NvimTree Toggle" },
    ["<leader>ef"] = { "<cmd> :NvimTreeFindFile <CR>", "NvimTree Find File" },
  }
}

return M
