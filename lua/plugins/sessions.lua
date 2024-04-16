return {
  "rmagatti/auto-session",
  config = function()
    require("auto-session").setup({
      log_level = "error",
      auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
    })

    -- ⚠️ This will only work if Telescope.nvim is installed
    vim.keymap.set("n", "<Leader>ls", require("auto-session.session-lens").search_session, {
      noremap = true,
    })
  end,
}
