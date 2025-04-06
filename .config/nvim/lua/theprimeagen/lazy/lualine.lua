return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require('lualine').setup({
      options = {
        theme = 'gruvbox',
        component_separators = "|",
        section_separators = '',
      },
      sections = {
        lualine_c = {{ 'filename', path = 1 }}, -- 2 -> absolute path
      }
    })
  end
}
