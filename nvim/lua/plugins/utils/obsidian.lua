return {
  'epwalsh/obsidian.nvim',
  version = '*',
  lazy = true,
  ft = 'markdown',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'hrsh7th/nvim-cmp',
    'nvim-telescope/telescope.nvim',
    'nvim-treesitter/nvim-treesitter',
    'epwalsh/pomo.nvim',
  },
  opts = {
    workspaces = {
      {
        name = 'Personal',
        path = '~/Documents/personal/Personal',
      },
      {
        name = 'Work',
        path = '~/Documents/personal/Professional',
        overrides = {
          notes_subdir = 'notes',
        },
      },
    },
  },
}
