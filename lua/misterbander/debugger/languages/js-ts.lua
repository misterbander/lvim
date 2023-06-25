local dap = require "dap"
local dap_vscode_js = require "dap-vscode-js"

local debugger_path = os.getenv("LUNARVIM_RUNTIME_DIR") .. "/site/pack/lazy/opt/vscode-js-debug"

dap_vscode_js.setup {
  node_path = "node",
  debugger_path = debugger_path,
  adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
}

for _, language in ipairs({ "javascript", "javascriptreact", "typescript", "typescriptreact" }) do
  dap.configurations[language] = {
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach",
      cwd = "${workspaceFolder}",
      localRoot = vim.fn.getcwd()
    }
  }
end
