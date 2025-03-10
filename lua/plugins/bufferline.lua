return {
  "akinsho/bufferline.nvim",
  branch = "main",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  after = 'catppuccin',
  config = function()
    vim.opt.termguicolors = true
    require("bufferline").setup({
      highlights = require("catppuccin.groups.integrations.bufferline").get(),
      options = {
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-tree",
            highlight = "Directory",
            text_align = "left",
          },
        },
        numbers = function(opts)
          return string.format("%s·%s", opts.raise(opts.id), opts.lower(opts.ordinal))
        end,
      },
    })
    vim.keymap.set("n", "<leader>dp", "<Cmd>BufferLineTogglePin<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>dP", "<Cmd>BufferLineGroupClose ungrouped<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>do", "<Cmd>BufferLineCloseOthers<CR>", { noremap = true, silent = true })
  end,
}
