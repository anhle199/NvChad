require("typescript").setup {
  server = {
    on_attach = require("custom.configs.utils").tsserver_on_attach,
  },
}
