return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      --window = {
      -- mappings = {
      --  ["<leader>"] = {"toggle_node", nowait = false}
      --}
      --}
    })
    vim.keymap.set('n','<leader>n',':Neotree filesystem toggle left<CR>', {})

  end

}
