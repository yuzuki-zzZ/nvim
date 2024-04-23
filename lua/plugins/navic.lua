return {
  "SmiteshP/nvim-navic",
  config = function()
    local navic = require("nvim-navic")

    navic.setup({
      lsp = {
        auto_attach = false,
        preference = nil,
      },
      highlight = true,
      separator = " > ",
      depth_limit = 0,
      depth_limit_indicator = "..",
      safe_output = true,
      lazy_update_context = false,
      click = false,
      format_text = function(text)
        return text
      end,
    })

    -- vim.api.nvim_set_hl(0, "NavicIconsFile", { default = true, fg = "#FFCBCB" })
    -- vim.api.nvim_set_hl(0, "NavicIconsModule", { default = true, fg = "#FFCBCB" })
    -- vim.api.nvim_set_hl(0, "NavicIconsNamespace", { default = true, fg = "#FFCBCB" })
    -- vim.api.nvim_set_hl(0, "NavicIconsPackage", { default = true, fg = "#FFCBCB" })
    -- vim.api.nvim_set_hl(0, "NavicIconsClass", { default = true, fg = "#FFCBCB" })
    -- vim.api.nvim_set_hl(0, "NavicIconsMethod", { default = true, fg = "#FFCBCB" })
    -- vim.api.nvim_set_hl(0, "NavicIconsProperty", { default = true, fg = "#FFCBCB" })
    -- vim.api.nvim_set_hl(0, "NavicIconsField", { default = true, fg = "#FFCBCB" })
    -- vim.api.nvim_set_hl(0, "NavicIconsConstructor", { default = true, fg = "#FFCBCB" })
    -- vim.api.nvim_set_hl(0, "NavicIconsEnum", { default = true, fg = "#FFCBCB" })
    -- vim.api.nvim_set_hl(0, "NavicIconsInterface", { default = true, fg = "#FFCBCB" })
    -- vim.api.nvim_set_hl(0, "NavicIconsFunction", { default = true, fg = "#FFCBCB" })
    -- vim.api.nvim_set_hl(0, "NavicIconsVariable", { default = true, fg = "#FFCBCB" })
    -- vim.api.nvim_set_hl(0, "NavicIconsConstant", { default = true, fg = "#FFCBCB" })
    -- vim.api.nvim_set_hl(0, "NavicIconsString", { default = true, fg = "#FFCBCB" })
    -- vim.api.nvim_set_hl(0, "NavicIconsNumber", { default = true, fg = "#FFCBCB" })
    -- vim.api.nvim_set_hl(0, "NavicIconsBoolean", { default = true, fg = "#FFCBCB" })
    -- vim.api.nvim_set_hl(0, "NavicIconsArray", { default = true, fg = "#FFCBCB" })
    -- vim.api.nvim_set_hl(0, "NavicIconsObject", { default = true, fg = "#FFCBCB" })
    -- vim.api.nvim_set_hl(0, "NavicIconsKey", { default = true, fg = "#FFCBCB" })
    -- vim.api.nvim_set_hl(0, "NavicIconsNull", { default = true, fg = "#FFCBCB" })
    -- vim.api.nvim_set_hl(0, "NavicIconsEnumMember", { default = true, fg = "#FFCBCB" })
    -- vim.api.nvim_set_hl(0, "NavicIconsStruct", { default = true, fg = "#FFCBCB" })
    -- vim.api.nvim_set_hl(0, "NavicIconsEvent", { default = true, fg = "#FFCBCB" })
    -- vim.api.nvim_set_hl(0, "NavicIconsOperator", { default = true, fg = "#FFCBCB" })
    -- vim.api.nvim_set_hl(0, "NavicIconsTypeParameter", { default = true, fg = "#FFCBCB" })
    -- vim.api.nvim_set_hl(0, "NavicText", { default = true, fg = "#FFFFFF" })
    -- vim.api.nvim_set_hl(0, "NavicSeparator", { default = true, fg = "#FFFFFF" })
  end,
}
