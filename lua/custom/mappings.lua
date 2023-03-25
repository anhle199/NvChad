---@type MappingsTable
local M = {}
local default_opts = { noremap = true, silent = true }

M.disabled = {
  n = {
    -- switch between windows
    ["<C-h>"] = "",
    ["<C-l>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",

    -- save file
    ["<C-s>"] = "",

    -- copy all
    ["<C-c>"] = "",

    -- line numbers
    ["<leader>n"] = "",
    ["<leader>rn"] = "",

    -- new buffer
    ["<leader>b"] = "",
    ["<leader>ch"] = "",

    -- plugin: tabufline
    ["<leader>x"] = "",

    -- plugin: lspconfig
    ["gD"] = "",
    ["<leader>D"] = "",
    ["<leader>ra"] = "", -- <leader>rn
    ["gr"] = "", -- <leader>rf
    ["<leader>f"] = "", -- <leader>d
    ["<leader>q"] = "", -- <leader>D
    ["<leader>fm"] = "", -- async = true
    ["<leader>wa"] = "",
    ["<leader>wr"] = "",
    ["<leader>wl"] = "",

    -- plugin: nvimtree
    ["<C-n>"] = "",
    ["<leader>e"] = "",

    -- plugin: telescope
    ["<leader>fh"] = "",
    ["<leader>fo"] = "",
    ["<leader>cm"] = "",
    ["<leader>gt"] = "",
    ["<leader>pt"] = "",

    -- plugin: nvterm
    ["<A-i>"] = "",
    ["<A-h>"] = "",
    ["<A-v>"] = "",
    ["<leader>h"] = "",
    ["<leader>v"] = "",

    -- plugin: whichkey
    ["<leader>wK"] = "",
    ["<leader>wk"] = "",

    -- plugin: gitsigns
    ["<leader>rh"] = "",
    ["<leader>td"] = "",
  },

  t = {
    -- plugin: nvterm
    ["<A-i>"] = "",
    ["<A-h>"] = "",
    ["<A-v>"] = "",
  }
}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    -- save file
    ["<leader>w"] = { "<cmd> w <CR>" },

    -- close file/buffer
    ["<leader>q"] = { "<cmd> q <CR>", "quit file", opts = default_opts },

    -- open lazy.nvim menu
    ["<leader>l"] = { "<cmd> Lazy <CR>" },
  },

  i = {
    -- escape insert mode
    ["jk"] = { "<ESC>", opts = default_opts },
  },

  v = {
    -- better indenting
    ["<"] = { "<gv", opts = default_opts },
    [">"] = { ">gv", opts = default_opts },

    -- move lines
    ["J"] = { ":move '>+1<cr>gv=gv", opts = default_opts },
    ["K"] = { ":move '<-2<cr>gv=gv", opts = default_opts },

    -- enable backspace
    ["<BS>"] = { '"_d', opts = default_opts }
  },
}

M.lspconfig = {
  plugin = true,

  n = {
    ["<leader>rn"] = {
      function()
        require("nvchad_ui.renamer").open()
      end,
      "lsp rename",
    },

    ["<leader>rf"] = {
      function()
        vim.lsp.buf.references()
      end,
      "lsp references",
    },

    ["<leader>d"] = {
      function()
        vim.diagnostic.open_float()
      end,
      "floating diagnostic",
    },

    ["<leader>D"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "diagnostic setloclist",
    },

    ["<leader>fm"] = {
      function()
        vim.lsp.buf.format { async = false }
      end,
      "lsp formatting",
    },
  },
}

M.nvimtree = {
  plugin = true,

  n = {
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
  },
}

return M
