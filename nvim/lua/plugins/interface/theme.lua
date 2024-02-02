return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      style = 'night',
      transparent = true,
      -- terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
      },
      -- hide_inactive_statusline = true,
      dim_inactive = true,
      lualine_bold = true,
    },
    config = function()
      vim.cmd [[colorscheme tokyonight]]
    end,
  },
}
