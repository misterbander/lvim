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

lvim.keys.normal_mode["<leader>gd"] = ":DiffviewOpen<CR>"
