vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>w", vim.cmd.w)
vim.keymap.set("n", "<leader>wq", vim.cmd.wq)
vim.keymap.set("n", "<leader>q", vim.cmd.close)
vim.keymap.set("n", "<leader>Q", vim.cmd.wqa)

vim.keymap.set("n", "-", ":split<CR>")
vim.keymap.set("n", "|", ":vsplit<CR>")

vim.keymap.set("n", "<leader>d", ":lua vim.diagnostic.open_float(nil, {scope=\"cursor\"})<CR>")


local auto_import = function()
    local params = vim.lsp.util.make_range_params()
    params.context = {
      only = { "source.addMissingImports.ts" },
    }
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
    for _, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.kind == "source.addMissingImports.ts" then
          vim.lsp.buf.code_action({
            apply = true,
            context = {
              only = { "source.addMissingImports.ts" },
            },
          })
        end
      end
    end
end

local organize_imports = function()
  local params = vim.lsp.util.make_range_params()
  params.context = {
    only = { "source.removeUnused.ts" },
  }
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
  for _, res in pairs(result or {}) do
    for _, r in pairs(res.result or {}) do
      if r.kind == "source.removeUnused.ts" then
        vim.lsp.buf.code_action({
          apply = true,
          context = {
            only = { "source.removeUnused.ts" },
          },
        })
      end
    end
  end
  vim.lsp.buf.execute_command({command = "_typescript.organizeImports", arguments = {vim.fn.expand("%:p")}})
end

vim.keymap.set("n", "<leader>i", auto_import)
vim.keymap.set("n", "<leader>o", organize_imports) 
