return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
    enabled = false,
  },

  {
    "nvim-neorg/neorg",
    dependencies = { "luarocks.nvim" },
    enabled = false,
    config = function()
      require("neorg").setup {

        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {
            config = {
              folds = true,
              icon_preset = "varied"
            }
          },
          ["core.dirman"] = {
            config = {
              workspaces = {
                notes = '~/notes',
                docs = '~/git/GSIQ-Docs',
                git = '~/git',
              },
              default_workspace = "notes",
              index = 'index.norg',
              open_last_workspace = true,
            },
          },

          ["core.completion"] = {
            config = {
              engine = "nvim-cmp",
            }
          },
          ["core.export"] = {
            config = {
              path = '~/notes/neorg/exports',
              filetype = "markdown",
            }
          },
          ["core.presenter"] = {
            config = {
              zen_mode = "zen-mode",
            },
          },
          ["core.summary"] = {},
          ["core.journal"] = {
            config = {
              -- journal_folder = '~/notes/journal_folder'
              -- template_name = ''
              -- use_template = true
              -- workspace = nil
            }
          },
          --   ["core.ui.calendar"] = {},
          --   ["core.dirman.utils"] = {},
          --   ["core.fs"] = {},
          --   ["core.highlights"] = {},
          --   ["core.integrations.nvim-cmp"] = {},
          --   ["core.integrations.treesitter"] = {},
          --   ["core.integrations.telescope"] = {},
          --   ["core.integrations.zen_mode"] = {},
          --   ["core.mode"] = {},
          --   -- ["core.neorgcmd"] = {},
          --   ["core.neorgcmd.commands.module.list"] = {},
          --   ["core.neorgcmd.commands.module.load"] = {},
          --   ["core.neorgcmd.commands.return"] = {},
          --   ["core.queries.native"] = {},
          --   ["core.scanner"] = {},
          --   ["core.storage"] = {},
          --   ["core.syntax"] = {},
            ["core.tempus"] = {},
            ["core.qol.toc"] = {},
            ["core.qol.todo_items"] = {},
          --   ["core.ui"] = {},
        },
      }
      vim.wo.foldlevel = 99
      vim.wo.conceallevel = 3
    end,
  }

  -- {
  --   "nvim-neorg/neorg",
  --   build = ":Neorg sync-parsers",
  --   ft = "norg",
  --   dependencies = { "nvim-lua/plenary.nvim", "nvim-neorg/neorg-telescope" },
  --   config = function()
  --     require("neorg").setup{
  --       load = {
  --         ["core.defaults"] = {},
  --         ["core.concealer"] = {},
  --         ["core.dirman"] = {
  --           config = {
  --             workspaces = {
  --               notes = '~/notes',
  --             },
  --             default_workspace = "notes",
  --           },
  --         },
  --         ["core.completion"] = {
  --           config = {
  --             engine = "nvim-cmp",
  --           }
  --         },
  --         ["core.export"] = {},
  --         ["core.export.markdown"] = {},
  --         ["core.presenter"] = {
  --           config = {
  --             zen_mode = "zen-mode",
  --           },
  --         },
  --         ["core.summary"] = {},
  --         ["core.ui.calendar"] = {},
  --         ["core.clipboard"] = {},
  --         ["core.dirman.utils"] = {},
  --         ["core.fs"] = {},
  --         ["core.highlights"] = {},
  --         ["core.integrations.nvim-cmp"] = {},
  --         ["core.integrations.treesitter"] = {},
  --         ["core.integrations.telescope"] = {},
  --         ["core.integrations.zen_mode"] = {},
  --         ["core.mode"] = {},
  --         ["core.neorgcmd"] = {},
  --         ["core.neorgcmd.commands.module.list"] = {},
  --         ["core.neorgcmd.commands.module.load"] = {},
  --         ["core.neorgcmd.commands.return"] = {},
  --         ["core.queries.native"] = {},
  --         ["core.scanner"] = {},
  --         ["core.storage"] = {},
  --         ["core.syntax"] = {},
  --         ["core.tempus"] = {},
  --         ["core.ui"] = {},
  --       },
  --     }
  --     vim.wo.foldlevel = 99
  --     vim.wo.conceallevel = 2
  --   end,
  -- }
}
