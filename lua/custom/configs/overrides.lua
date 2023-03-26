local M = {}

M.treesitter = {
  -- stylua: ignore
  ensure_installed = {
    "bash", "c", "cpp", "help", "html", "javascript", "json", "json5", "jsonc",
    "lua", "luadoc", "luap", "markdown", "markdown_inline", "python", "query",
    "regex", "tsx", "typescript", "vim", "yaml", "css", "java", "rust",
    "dockerfile", "sql",
  },
  indent = {
    enable = true,
    disable = { "python" },
  },
  autotag = {
    enable = true,
  },
}

M.mason = {
  ensure_installed = {
    -- lua dev
    "lua-language-server",
    "stylua",

    -- web dev
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "prettier",

    -- python dev
    "pyright",
    -- "djlint",
    "black",
    "isort",
    "pylint",
    "flake8",

    -- others
    "json-lsp",
  },
}

-- git support in nvimtree
M.nvimtree = {
  disable_netrw = true,
  view = {
    width = 36,
  },
  git = {
    enable = true,
  },
  renderer = {
    group_empty = true,
    highlight_git = true,
    highlight_modified = "all",
    icons = {
      show = {
        git = true,
      },
      git_placement = "after",
    },
  },
  actions = {
    open_file = {
      window_picker = {
        chars = "1234567890",
      },
    },
  },
}

M.telescope = {
  defaults = {
    prompt_prefix = " 󰍉 ",
    selection_caret = " ",
    file_ignore_patterns = { "node_modules", "dist", "__pycache__", "build" },
    layout_config = {
      horizontal = {
        preview_width = 0.6,
      },
      width = 0.9,
      height = 0.9,
    },
    mappings = {
      i = {
        ["<C-j>"] = require("telescope.actions").move_selection_next,
        ["<C-k>"] = require("telescope.actions").move_selection_previous,
      },
    },
  },
}

M.blankline = {
  show_current_context_start = false,
}

M.cmp = function(_, opts)
  local cmp = require("cmp")

  local override_mappings = {
    ["<C-p>"] = cmp.config.disable,
    ["<C-n>"] = cmp.config.disable,
    ["<C-f>"] = cmp.config.disable,
    ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<C-u>"] = cmp.mapping.scroll_docs(4),
  }
  opts.mapping = vim.tbl_deep_extend("force", opts.mapping, override_mappings)

  opts.source = {
    { name = "luasnip" },
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "path" },
  }
end

return M
