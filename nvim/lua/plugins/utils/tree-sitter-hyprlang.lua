vim.filetype.add({
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})
return {
  -- "luckasRanarison/tree-sitter-hyprlang",
  -- dependencies = { "nvim-treesitter/nvim-treesitter" },
}
