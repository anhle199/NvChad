local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {
  -- web dev stuff
  b.formatting.prettier,
  -- require("typescript.extensions.null-ls.code-actions"),

  -- Lua
  b.formatting.stylua,

  -- python
  b.formatting.black.with({ extra_args = { "--fast", "--line-length=120" } }),
  b.formatting.isort.with({ extra_args = { "--style=black" } }),
  -- b.formatting.djlint,
  -- b.diagnostics.djlint,
  b.diagnostics.flake8,
  b.diagnostics.pylint,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
