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
    disable = {
      "python"
    },
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
    group_emtpy = true,
    highlight_git = true,
    highlight_modified = "all",
    icons = {
      show = {
        git = true,
      },
      git_replacement = "after",
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
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.6,
        results_width = 0.9,
      },
    },
  },
}

return M
