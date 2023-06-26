local dap_vscode_js = require "dap-vscode-js"
local load_launchjs = require("dap.ext.vscode").load_launchjs

local debugger_path = os.getenv("LUNARVIM_RUNTIME_DIR") .. "/site/pack/lazy/opt/vscode-js-debug"

dap_vscode_js.setup {
  node_path = "node",
  debugger_path = debugger_path,
  adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
}

load_launchjs(nil, { ["pwa-node"] = { "javascript", "javascriptreact", "typescript", "typescriptreact" } })
