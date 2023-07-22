local diffview = require "diffview"

diffview.setup {
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
	}
}

lvim.builtin.which_key.mappings["g"]["d"] = { "<Cmd>DiffviewOpen<CR>", "Git Diffview" }
