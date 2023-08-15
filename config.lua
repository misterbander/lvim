-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

lvim.plugins = {
	{ "sitiom/nvim-numbertoggle", event = "BufRead" },
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end
	},
	{ "mxsdev/nvim-dap-vscode-js" },
	{
		"microsoft/vscode-js-debug",
		build = "npm i --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
	},
	{ "sindrets/diffview.nvim", event = "BufRead" },
	{
		"windwp/nvim-ts-autotag",
		event = "VeryLazy",
		config = function()
			require("nvim-ts-autotag").setup()
		end
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "BufRead",
		config = function()
			require "lsp_signature".on_attach()
		end
	},
	{
		"leoluz/nvim-dap-go",
		config = function()
			require("dap-go").setup({
				dap_configurations = {
					{
						-- Must be "go" or it will be ignored by the plugin
						type = "go",
						name = "Attach remote",
						mode = "remote",
						request = "attach",
					}
				}
			})
		end
	},
	{
		"stevearc/stickybuf.nvim",
		opts = {},
	},
	{
		"petertriho/nvim-scrollbar",
		config = function()
			require("scrollbar").setup()
		end
	},
	{
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end
	},
	{
		"rest-nvim/rest.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("rest-nvim").setup()
		end
	}
}

lvim.builtin.treesitter.autotag.enable = true
lvim.builtin.nvimtree.setup.prefer_startup_root = true
lvim.builtin.nvimtree.setup.filters.custom = {}

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = false
vim.opt.scrolloff = 0


-- Keymappings

-- Alt-0 to focus nvim-tree
lvim.keys.normal_mode["<M-0>"] = "<Cmd>NvimTreeFocus<CR>"
lvim.keys.insert_mode["<M-0>"] = "<Cmd>stopinsert<CR><Cmd>NvimTreeFocus<CR>"
lvim.keys.term_mode["<M-0>"] = "<C-Bslash><C-N><Cmd>NvimTreeFocus<CR>"

-- Ctrl-/ to toggle comment
lvim.keys.normal_mode["<C-_>"] = "<Cmd>lua require('Comment.api').toggle.linewise()<CR>"
lvim.keys.insert_mode["<C-_>"] = "<Cmd>lua require('Comment.api').toggle.linewise()<CR>"
lvim.keys.visual_mode["<C-_>"] = ":lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>"

-- Exit search mode
lvim.keys.normal_mode["<Esc>"] = "<Cmd>noh<CR>"

-- Ctrl+S to save all
lvim.keys.normal_mode["<C-s>"] = "<Cmd>wa<CR>"
lvim.keys.insert_mode["<C-s>"] = "<Cmd>stopinsert<CR><Cmd>wa<CR>"

-- Ctrl+Backspace to delete a word
lvim.keys.insert_mode["<C-H>"] = "<C-W>"

-- Ctrl-W to kill buffer (close tab)
lvim.keys.normal_mode["<C-W>"] = "<Cmd>BufferKill<CR>"

-- Alt+Left and Alt+Right to move between tabs
lvim.keys.normal_mode["<M-Left>"] = "<Cmd>BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<M-Right>"] = "<Cmd>BufferLineCycleNext<CR>"

-- Shift+Alt+Left and Shift+Alt+Right to move tabs
lvim.keys.normal_mode["<S-M-Left>"] = "<Cmd>BufferLineMovePrev<CR>"
lvim.keys.normal_mode["<S-M-Right>"] = "<Cmd>BufferLineMoveNext<CR>"

-- Alt+Up and Alt+Down to move lines
lvim.keys.normal_mode["<M-Up>"] = "<Cmd>m-2<CR>=="
lvim.keys.normal_mode["<M-Down>"] = "<Cmd>m+<CR>=="
lvim.keys.insert_mode["<M-Up>"] = "<Cmd>stopinsert<CR><Cmd>m .-2<CR>==gi"
lvim.keys.insert_mode["<M-Down>"] = "<Cmd>stopinsert<CR><Cmd>m .+1<CR>==gi"
lvim.keys.visual_mode["<M-Up>"] = ":m '<-2<CR>gv-gv"
lvim.keys.visual_mode["<M-Down>"] = ":m '>+1<CR>gv-gv"

-- Remove default toggleterm mappings
lvim.builtin.terminal.insert_mappings = false
lvim.builtin.terminal.open_mapping = false
lvim.builtin.terminal.execs = {}

-- Ctrl-X exits terminal mode
lvim.keys.term_mode["<C-x>"] = "<C-Bslash><C-N>"

-- Alt-1, Alt-2, Alt-3 toggles respective horizontal terminals, and Alt-4 toggles floating terminal
lvim.keys.normal_mode["<M-1>"] =
"<Cmd>1ToggleTerm direction=horizontal size=12<CR><Cmd>lua require('misterbander.toggleterm-auto-insert')()<CR>"
lvim.keys.normal_mode["<M-2>"] =
"<Cmd>2ToggleTerm direction=horizontal size=12<CR><Cmd>lua require('misterbander.toggleterm-auto-insert')()<CR>"
lvim.keys.normal_mode["<M-3>"] =
"<Cmd>3ToggleTerm direction=horizontal size=12<CR><Cmd>lua require('misterbander.toggleterm-auto-insert')()<CR>"
lvim.keys.normal_mode["<M-4>"] = "<Cmd>4ToggleTerm<CR><Cmd>lua require('misterbander.toggleterm-auto-insert')()<CR>"
lvim.keys.term_mode["<M-1>"] =
"<C-Bslash><C-N><Cmd>1ToggleTerm direction=horizontal size=12<CR><Cmd>lua require('misterbander.toggleterm-auto-insert')()<CR>"
lvim.keys.term_mode["<M-2>"] =
"<C-Bslash><C-N><Cmd>2ToggleTerm direction=horizontal size=12<CR><Cmd>lua require('misterbander.toggleterm-auto-insert')()<CR>"
lvim.keys.term_mode["<M-3>"] =
"<C-Bslash><C-N><Cmd>3ToggleTerm direction=horizontal size=12<CR><Cmd>lua require('misterbander.toggleterm-auto-insert')()<CR>"
lvim.keys.term_mode["<M-4>"] =
"<C-Bslash><C-N><Cmd>4ToggleTerm<CR><Cmd>lua require('misterbander.toggleterm-auto-insert')()<CR>"

lvim.builtin.which_key.mappings["r"] = {
	name = "REST",
	r = { "<Plug>RestNvim", "Run Rest" }
}

-- Formatters
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
	{ name = "prettierd", filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "json", "css" } }
}

-- Linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
	{ name = "eslint_d", filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" } }
}


reload "misterbander.debugger"
reload "misterbander.diffview"
