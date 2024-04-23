local color_scheme = require("../color-scheme/kopicat")

return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      treesitter = true,
      notify = false,
      ufo = true,
      mini = {
        enabled = true,
        indentscope_color = "",
      },
      leap = true,
      neotree = true,
      navic = {
        enabled = true,
        custom_bg = "NONE", -- "lualine" will set background to mantle
      },
      telescope = {

        -- style = "nvchad"
      },
      illuminate = {
        enabled = true,
        lsp = false,
      },
    },
  },
  config = function(_, opts)
    require("catppuccin").setup(vim.tbl_extend("force", opts, color_scheme))
    vim.cmd.colorscheme("catppuccin")
  end,
}
