return {
  {
    'neovim/nvim-lspconfig',
    enabled = (not vim.g.vscode),
  },
  {
    'hrsh7th/nvim-cmp',
    enabled = (not vim.g.vscode),
  },
  {
    "mfussenegger/nvim-lint",
    enabled = (not vim.g.vscode),
  },
  {
    'nvimtools/none-ls.nvim',
    enabled = (not vim.g.vscode),
  }
}
