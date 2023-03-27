M.tsserver_on_attach = function(client, bufnr)
  local on_attach = require("plugins.configs.lspconfig").on_attach

  on_attach(client, bufnr)
  if client.name == "tsserver" then
    vim.keymap.set("n", "<leader>co", "<cmd>TypescriptOrganizeImports<CR>", { buffer = bufnr })
  end
end
