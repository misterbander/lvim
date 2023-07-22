local diffview = require "diffview"

diffview.setup {
	enhanced_diff_hl = true,
	keymaps = {
		view = {
			q = ":DiffviewClose<CR>"
		},
		file_panel = {
			q = ":DiffviewClose<CR>"
		},
		file_history_panel = {
			q = ":DiffviewClose<CR>"
		}
	},
	hooks = {
		diff_buf_read = function()
			vim.cmd("norm! gg]ckzt") -- Set cursor on the first hunk
		end,
		diff_buf_win_enter = function()
			vim.opt_local.foldlevel = 99
		end
	}
}

lvim.builtin.which_key.mappings["g"]["d"] = { "<Cmd>DiffviewOpen<CR>", "Git Diffview" }

-- Temporary workaround since actual changes in diff mode aren't highlighted
lvim.autocommands = {
	{
		{ "ColorScheme" },
		{
			pattern = "*",
			callback = function()
				vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#1c444a", underline = false, bold = false })
				vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#801919", underline = false, bold = false })
				vim.api.nvim_set_hl(0, "DiffChange", { bg = "#1d2739", underline = false, bold = false })
				vim.api.nvim_set_hl(0, "DiffText", { bg = "#3c4e77", underline = false, bold = false })
			end,
		},
	},
}
