return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    opts = {
      style = "moon",
      styles = {
        comments = { italic = true },
        keywords = { italic = false },
      },
    },
  },

  {
    'ellisonleao/gruvbox.nvim',
    config = true,
    opts = {},
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'catppuccin'
    end
  }
}

-- vim: ts=2 sts=2 sw=2 et
