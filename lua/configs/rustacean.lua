local codelldb_pkg = vim.fn.expand "$MASON/packages/codelldb"
local extension_path = codelldb_pkg .. "/extension/"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb.so"

local rustaceanvim_config = require "rustaceanvim.config"

vim.g.rustaceanvim = {
  dap = {
    adapter = rustaceanvim_config.get_codelldb_adapter(codelldb_path, liblldb_path),
  },
}
