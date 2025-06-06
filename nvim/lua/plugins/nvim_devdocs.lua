-- No example configuration was found for this plugin.
--
-- For detailed information on configuring this plugin, please refer to its
-- official documentation:
--
--   https://github.com/luckasRanarison/nvim-devdocs
--
-- If you wish to use this plugin, you can optionally modify and then uncomment
-- the configuration below.

return {
  "luckasRanarison/nvim-devdocs",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter"
  },
  config = function ()
    require("nvim-devdocs").setup()
  end
}
