return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  config = function()
    -- vim.o.background = "light" -- ou "dark" para modo escuro
    vim.o.background = "dark"

    -- Ativando o esquema de cores Gruvbox
    vim.cmd([[colorscheme gruvbox]])

    -- Configurar transparência com o plugin 'nvim-transparent'
    require("transparent").setup({
      enable = true, -- ativa transparência
      extra_groups = { -- Ajusta grupos adicionais
        "Normal",
        "NormalNC",
        "TelescopeNormal",
        "TelescopeBorder",
      },
      exclude = {}, -- grupos que não devem ser transparentes
    })

    -- Aplica transparência ao fundo (opcional, se não usar nvim-transparent)
    vim.cmd([[
      hi Normal guibg=NONE ctermbg=NONE
      hi NormalNC guibg=NONE ctermbg=NONE
    ]])
  end,
  opts = {},
  dependencies = {
    "xiyaowong/nvim-transparent",
  },
}
