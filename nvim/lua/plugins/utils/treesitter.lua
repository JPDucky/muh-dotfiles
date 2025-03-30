-- for _, config in pairs(require("nvim-treesitter.parsers").get_parser_configs()) do
--   config.install_info.use_makefile = true
--   config.install_info.cxx_standard = 'c++99'
-- end

return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
      {'nvim-treesitter/nvim-treesitter-refactor'},
      {'nvim-treesitter/nvim-treesitter-textobjects'},
      {
        'nvim-treesitter/playground',
        cmd = "TSPlaygroundToggle",
      },
      {'nvim-treesitter/nvim-treesitter-context'},
    },
    -- lazy = false,
    -- version = nil,
    init = function()
      local parser_dir = vim.fn.stdpath("data") .. "/treesitter"
      vim.opt.runtimepath:prepend(parser_dir)
    end,
    config = function()

      require("nvim-treesitter.install").prefer_git = true

      require('nvim-treesitter.configs').setup({
        ensure_installed = { 
          'c', 'cpp', 'go', 'lua', 'python', 'rust',
          'javascript', 'typescript', 'tsx',
          'html', 'css', 'java', 'elixir', 'heex',
          'markdown', 'markdown_inline', 'vimdoc',
          'dockerfile', 'yaml', 'terraform', 'hcl',
          'json', 'bash', 'vim', 'query'
        },
        sync_install = false,
        ignore_install = { "norg", "erlang" },
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<c-space>',
            node_incremental = '<c-space>',
            scope_incremental = '<c-s>',
            node_decremental = '<M-space>',
          },
        },
        refactor = {
          highlight_definitions = {
            enable = true,
            clear_on_cursor_move = true,
          },
          highlight_current_scope = { enable = true },
          smart_rename = {
            enable = true,
            keymaps = { smart_rename = 'crr' },
          },
          navigation = {
            enable = true,
            keymaps = {
              goto_definition = 'gd',
              list_definitions = 'gD',
              list_definitions_toc = 'gO',
              goto_next_usage = '<a-*>',
              goto_previous_usage = '<a-#>',
            },
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ac'] = '@class.outer',
              ['ic'] = '@class.inner',
              ['aa'] = '@parameter.outer',
              ['ia'] = '@parameter.inner',
              ['as'] = '@scope',
            },
            selection_modes = {
              ['@parameter.outer'] = 'v', -- charwise
              ['@function.outer'] = 'V', -- linewise
              ['@class.outer'] = '<c-v>', -- blockwise
            },
            include_surrounding_whitespace = true,
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              [']m'] = '@function.outer',
              [']]'] = '@class.outer',
            },
            goto_next_end = {
              [']M'] = '@function.outer',
              [']['] = '@class.outer',
            },
            goto_previous_start = {
              ['[m'] = '@function.outer',
              ['[['] = '@class.outer',
            },
            goto_previous_end = {
              ['[M'] = '@function.outer',
              ['[]'] = '@class.outer',
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ['<leader>a'] = '@parameter.inner',
            },
            swap_previous = {
              ['<leader>A'] = '@parameter.inner',
            },
          },
        },
        playground = {
          enable = true,
          updatetime = 25,
          persist_queries = false,
          keybindings = {
            toggle_query_editor = 'o',
            toggle_hl_groups = 'i',
            toggle_injected_languages = 't',
            toggle_anonymous_node = 'a',
            toggle_language_display = 'I',
            focus_language = 'f',
            unfocus_language = 'F',
            update = 'R',
            goto_node = '<CR>',
            show_help = '?',
          },
        },
        context = {
          enable = true,
          max_lines = 0,
          min_window_height = 0,
          line_numbers = true,
          multiline_threshold = 20,
          trim_scope = 'outer',
          mode = 'cursor',
          separator = nil,
          zindex = 20,
        },
        matchup = {
          enable = true,
          disable = { 'c', 'ruby' },
        },
      })
    end
  }
}
