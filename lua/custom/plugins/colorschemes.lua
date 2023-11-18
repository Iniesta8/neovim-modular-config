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
    'rebelot/kanagawa.nvim',
    lazy = false,
    opts = {},
    config = function()
      vim.cmd.colorscheme 'kanagawa'
    end
  },

  {
    'Mofiqul/vscode.nvim',
    opts = {},
  },

  {
    'projekt0n/github-nvim-theme',
    lazy = false,
  }
}

-- vim: ts=2 sts=2 sw=2 et
