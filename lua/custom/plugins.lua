local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {
  -- Override plugin definition options
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
      -- {
      --   "b0o/SchemaStore.nvim",
      --   lazy = true,
      --   ft = { "json", "json5", "jsonc" },
      -- },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  {
    "numToStr/Comment.nvim",
    dependencies = {
      {
        "JoosepAlviste/nvim-ts-context-commentstring",
        lazy = true,
        ft = { "javascript", "typescript", "javascriptreact", "typescriptreact", "vue", "tsx", "jsx" },
      },
    },
    config = function()
      require("Comment").setup {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
  },

  -- override plugin configs
  { "williamboman/mason.nvim", opts = overrides.mason },
  { "nvim-treesitter/nvim-treesitter", opts = overrides.treesitter },
  { "nvim-tree/nvim-tree.lua", opts = overrides.nvimtree },
  { "nvim-telescope/telescope.nvim", opts = overrides.telescope },
  { "lukas-reineke/indent-blankline.nvim", opts = overrides.blankline },
  { "hrsh7th/nvim-cmp", opts = overrides.cmp },

  -- new plugins
  {
    "windwp/nvim-ts-autotag",
    lazy = true,
    -- stylua: ignore
    ft = {
      "html", "htmldjango", "javascript", "typescript", "javascriptreact",
      "typescriptreact", "svelte", "vue", "tsx", "jsx", "rescript", "xml",
      "php", "markdown", "glimmer", "handlebars", "hbs",
    },
  },

  {
    "akinsho/bufferline.nvim",
    lazy = true,
    event = "TabEnter",
    opts = require "custom.configs.bufferline",
  },

  {
    "jose-elias-alvarez/typescript.nvim",
    lazy = true,
    ft = { "javascript", "typescript", "javascriptreact", "typescriptreact", "vue", "tsx", "jsx" },
    config = function()
      require "custom.configs.typescript"
    end,
  },

  -- disable plugins
  { "folke/which-key.nvim", enabled = false },
  { "NvChad/nvterm", enabled = false },
  { "NvChad/nvim-colorizer.lua", enabled = false },
  { "hrsh7th/cmp-buffer", enabled = false },
}

return plugins
