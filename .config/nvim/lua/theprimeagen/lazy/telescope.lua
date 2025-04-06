return {
  "nvim-telescope/telescope.nvim",

  tag = "0.1.5",

  dependencies = {
    "nvim-lua/plenary.nvim"
  },

  config = function()
    require('telescope').setup({
      defaults = {
        layout_strategy = "vertical",
        layout_config = {
          vertical = {
            preview_height = 0.7,  -- Ajusta a altura do preview
            mirror = false,        -- Mantém a posição padrão do preview
          },
          preview_cutoff = 1, -- Garante que o preview nunca seja escondido em telas pequenas
        },
      },
    })

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
    vim.keymap.set('n', '<C-p>', builtin.git_files, {})

    vim.keymap.set('n', '<leader>pws', function()
      local word = vim.fn.expand("<cword>")
      builtin.grep_string({
        search = word,
        layout_strategy = "vertical",
        layout_config = { preview_cutoff = 1, preview_height = 0.4 },
        previewer = true
      })
    end)

    vim.keymap.set('n', '<leader>pWs', function()
      local word = vim.fn.expand("<cWORD>")
      builtin.grep_string({
        search = word,
        layout_strategy = "vertical",
        layout_config = { preview_cutoff = 1, preview_height = 0.4 },
        previewer = true
      })
    end)

    vim.keymap.set('n', '<leader>ps', function()
      builtin.live_grep({
        layout_strategy = "vertical",
        layout_config = { preview_cutoff = 1, preview_height = 0.4 },
        previewer = true
      })
    end)

    vim.keymap.set('n', '<leader>lg', function()
      builtin.live_grep({
        layout_strategy = "vertical",
        layout_config = { preview_cutoff = 1, preview_height = 0.4 },
        previewer = true
      })
    end)

    vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
  end
}

