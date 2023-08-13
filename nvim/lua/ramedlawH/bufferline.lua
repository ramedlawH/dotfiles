-- TYPE: :h bufferline-configurations for all config options

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local bufferline = require("bufferline")
-- overwrite some defaults
bufferline.setup({
  options = {
    buffer_close_icon = '',
    middle_mouse_command = "bdelete! %d",
    diagnostics =  "nvim_lsp",
    hover = {
        enabled = true,
        delay = 200,
        reveal = {'close'}
    },
  }
})
