--  NOTE: This file needs to be loaded last, otherwise the dependencies do not get loaded and it throws an error

-- which-key imports: (these need to be listed as dependencies for which-key)

--  NOTE: Put references to any modules here if you want to use them in a keybind
local dap = require 'dap'
local dapui = require 'dapui'
local tele = require('telescope.builtin')
local bufferline = require('bufferline')
local wk = require 'which-key'
local telescope = require('telescope')
local finders = require('telescope.finders')
local pickers = require('telescope.pickers')
local conf = require('telescope.config').values
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')


local functions_module = require('after.plugins.functions.functions')

-- local mappings = functions_module.default
-- local project_keys = functions_module.project

--
--
-- local custom_picker = function(opts)
--
--   opts = opts or {}
--
--   local results_func = opts.results_func
--   if not results_func then
--     print("No function provided")
--     return
--   end
--
--   pickers.new {
--     prompt_title = opts.title or "Custom Picker"
--     finder = finders.new_table{
--       results = results_func(),
--       entry_maker = makers.new_table()
--     },
--     sorter = conf.generic_sorter(opts),
--     attach_mappings = opts.mappings or function()
--       return true
--     end,
--   }
-- end
--
-- local function get_buffer()
--   local bufs = {}
--   for _, buf in ipairs(vim.api.nvim_list_bufs()) do
--     local buf_name = vim.api.nvim_buf_get_name(buf)
--     table.insert(bufs, buf_name)
--   end
--   return bufs
-- end
--
--
-- require('telescope').extensions.custom_picker {
--   result_func = get_buffers,
--   mappings = function(prompt_bufnr)
--   end,
--   title = "Buffers"
-- }
--
--
--

















-- this feels most natural
vim.o.timeout = true
vim.o.timeoutlen = 550

return {
  -- lua with lazy.nvim
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup {
          timeout = 400,
          default_mappings = true,
          mappings = {
              i = {
                  j = {
                      -- These can all also be functions
                      j = "<Esc>",
                  },
                  k = {
                      k = "<Esc>",
                  },
              },
              c = {
                  j = {
                      -- These can all also be functions
                      j = "<Esc>",
                  },
                  k = {
                      k = "<Esc>",
                  },
              },
              -- t = {
              --     j = {
              --         k = "<C-\\><C-n>",
              --     },
              -- },
              -- v = {
              --     j = {
              --         k = "<Esc>",
              --     },
              -- },
              s = {
                  j = {
                      k = "<Esc>",
                  },
              },
          },
      }
    end,
  },
  {
    'folke/which-key.nvim',
    event = "BufEnter",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 30
    end,
    opts = {
      -- window = {
      --   border = "single",   -- none | single | double | shadow
      --   position = "bottom", -- bottom | top
      --   margin = { 1, 0, 1, 0 },
      --   padding = { 1, 2, 1, 2 },
      --   windblend = 0,
      --   zindex = 1000,
      -- },
      triggers = {
        { "<auto>", mode = "nixsotc" },
        { "a", mode = { "n", "v" } },
      },
      -- triggers_blacklist = {
      --   -- i = { "j", "k" },
      --   -- v = { "j", "k" },
      --   n = { "q", "@", "u", "t", "s", "c", "h", "j", "k", "l", "o" },
      -- },
    },
  },

  -- {
  --   "max397574/better-escape.nvim",
  --   opts = {
  --     mapping = { "jk", "jj", "kk" }, --mappings for escaping insert mode
  --     timeout = 400,
  --     clear_empty_lines = true,
  --     keys = '<Esc>',
  --   },
  -- },

  --  TODO: Move these::
  -- non-which-key keymaps:

  -- line bumpers
  -- vim.keymap.set('n', '<A-h>', '<C-w>h', { desc = 'Jump to window Left' }),
  -- vim.keymap.set('n', '<A-l>', '<C-w>l', { desc = 'Jump to window Right' }),
  -- vim.keymap.set('n', '<a-j>', '<C-w>j', { desc = 'Jump to window Down' }),
  -- vim.keymap.set('n', '<a-k>', '<C-w>k', { desc = 'Jump to window Up' }),

  vim.keymap.set('n', '<A-K>', '<Cmd>m .-2<CR>==', { desc = 'Move Line Up' }),
  vim.keymap.set('i', '<A-K>', '<Esc><Cmd>m .-2<CR>==gi', { desc = 'Move Line Up' }),
  vim.keymap.set('v', '<A-K>', ":m '<-2<CR>gv=gv'", { desc = 'Move Line Up' }),
  vim.keymap.set('n', '<A-J>', '<Cmd>m .+1<CR>==', { desc = 'Move Line Down' }),
  vim.keymap.set('i', '<A-J>', '<Esc><Cmd>m .+1<CR>==gi', { desc = 'Move Line Down' }),
  vim.keymap.set('v', '<A-J>', ":m '>+1<CR>gv=gv'", { desc = 'Move Line Down' }),




  vim.keymap.set('i', 'jj', '<Esc>'),
  vim.keymap.set('i', 'kk', '<Esc>'),

  -- Clear search highlighting with Escape
  --
  vim.keymap.set({ 'i', 'n' }, '<Esc>', '<Cmd>noh<CR><Esc>', { desc = 'Escape and clear hlsearch' }),

  -- Undo Breakpoints
  vim.keymap.set('i', ',', ',<C-g>u'),
  vim.keymap.set('i', '.', '.<C-g>u'),
  vim.keymap.set('i', ';', ';<C-g>u'),
  vim.keymap.set('i', ')', ')<C-g>u'),

  -- Better Indents in visual mode
  vim.keymap.set('v', '<', '<gv'),
  vim.keymap.set('v', '>', '>gv'),

  -- Lazy UI
  vim.keymap.set('n', '<leader>ll', '<Cmd>Lazy<CR>', { desc = 'Lazy UI' }),

  -- netrw
  vim.keymap.set('n', '<leader>pv', ':Ex<CR>', { desc = 'netrw' }),

  -- harpoon
  -- local mark = require("harpoon.mark")
  -- local ui = require("harpoon.ui")
  -- vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Add to Harpoon" })
  -- vim.keymap.set("n", "<leader>pe", ui.toggle_quick_menu, { desc = "Harpoon" })

  --vim.keymap.set("i", "lll", "<Esc>")
  --vim.keymap.set("i", "hh", "<Esc>")

  -- undo tree
  -- vim.keymap.set("n", "<leader>uu", vim.cmd.UndotreeToggle, { desc = "Undo Tree" })

  -- telescope
  --vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Find Files" })
  --vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Find git Files" })

  -- telescope undo
  -- vim.keymap.set('n', '<leader>uu', '<cmd>Telescope undo<cr>'),

  -- Diagnostic keymaps
  --vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
  --vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
  --vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
  --vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

  -- quick yoink
  vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y', { desc = 'Yoink to System Clipboard' }),
  vim.keymap.set({ 'n', 'v' }, '<leader>P', '"+p', { desc = 'Plop from System Clipboard' }),

  --buffers
  vim.keymap.set("n", "<S-h>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Buffer Left" }),
  vim.keymap.set("n", "<S-l>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Buffer Right" }),
  -- vim.keymap.set("n", "<leader>bg", "<Cmd>BufferLinePick<CR>", { desc = "Goto Buffer _n" }),
  -- vim.keymap.set("n", "<leader>bc", "<Cmd>BufferLinePickClose<CR>", { desc = "Close Buffer _n" }),
  --
  -- copilot
  -- local copilot_on = true
  -- vim.api.nvim_create_user_command("CopilotToggle", function()
  --   if copilot_on then
  --     vim.cmd("Copilot disable")
  --     print("Copilot OFF")
  --   else
  --     vim.cmd("Copilot enable")
  --     print("[Copilot] Online")
  --   end
  --   copilot_on = not copilot_on
  -- end, { nargs = 0 })
  -- vim.keymap.set("n", "<leader>ct", ":CopilotToggle<CR>", { desc = "Copilot Toggle" })
  -- navigation
  -- vim.keymap.set('i', 'jj', '<Esc>'),
  -- vim.keymap.set('i', 'kk', '<Esc>'),
  -- NOTE: Hold 'alt' to move around in insert mode

  -- basic moves
  vim.keymap.set('i', '<M-h>', '<C-o>h', { noremap = true, silent = true }),
  vim.keymap.set('i', '<M-l>', '<C-o>l', { noremap = true, silent = true }),
  vim.keymap.set('i', '<M-j>', '<C-o>j', { noremap = true, silent = true }),
  vim.keymap.set('i', '<M-k>', '<C-o>k', { noremap = true, silent = true }),

  -- basic hops
  vim.keymap.set('i', '<M-e>', '<C-o>e', { noremap = true, silent = true }),
  vim.keymap.set('i', '<M-b>', '<C-o>b', { noremap = true, silent = true }),
  vim.keymap.set('i', '<M-w>', '<C-o>w', { noremap = true, silent = true }),

  -- basic operations
  vim.keymap.set('i', '<M-o>', '<C-o>o', { noremap = true, silent = true }),
  vim.keymap.set('i', '<M-O>', '<C-o>O', { noremap = true, silent = true }),

  --NOTE: setup functions here, define them below

  -- neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
  --   keybinds.map_event_to_mode("norg", {
  --     n = {
  --       { "<C-s>", "core.integrations.telescope.find_linkable" },
  --     },
  --
  --     i = {
  --       { "<C-l>", "core.integrations.telescope.insert_link" },
  --     },
  --   }, {
  --     silent = true,
  --     noremap = true,
  --   })
  -- end)

  -- NOTE: which-key bindings
  -- All of these bindings are prefaced with the leader key, more to come

  wk.add {
    { "<A-i>", "<Cmd>FloatermToggle<CR>", desc = "Float-Term Toggle", mode = { "n", "t" } },
    -- Non-leader mappings
    { "f", function() require('flash').treesitter() end, desc = "Flash Treesitter" },

    -- Go-To mappings
    { "gB", function() tele.builtin {} end, desc = "GOTO Builtins" },
    { "gd", function() tele.lsp_definitions {} end, desc = "GOTO Definition" },
    { "gD", function() tele.lsp_type_definitions {} end, desc = "GOTO Type Definitions" },
    { "gI", function() tele.lsp_implementations {} end, desc = "GOTO Implementation" },
    { "gm", function() tele.marks {} end, desc = "GOTO Marks" },
    { "gr", function() tele.lsp_references {} end, desc = "GOTO References" },
    { "gT", function() tele.treesitter {} end, desc = "GOTO Treesitter" },
    { "gl", function() tele.loclist {} end, desc = "GOTO Location List" },
    { "gs", function() tele.symbols {} end, desc = "GOTO Symbols" },

    -- Leader mappings
    { "<leader>/", function() 
      tele.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({ winblend = 10, previewer = false }))
    end, desc = "Search Current Buffer (Fuzzy)" },
    { "<leader><space>", function() tele.buffers() end, desc = "Find Existing Buffers" },
    { "<leader>?", function() tele.oldfiles() end, desc = "Show Recent Files" },

    -- Actions group
    { "<leader>a", name = "[A]ctions" },

    -- Buffer group
    { "<leader>b", name = "[B]uffer" },
    { "<leader>bd", desc = "Delete Current Buffer" },
    { "<leader>bD", desc = "Delete Current Buffer (Force)" },
    { "<leader>bg", function() bufferline.pick() end, desc = "Select Buffer" },
    { "<leader>bc", function() bufferline.close_with_pick() end, desc = "Close Select Buffer" },

    -- Code group
    { "<leader>c", name = "[C]ode" },
    { "<leader>ca", function() vim.lsp.buf.code_action() end, desc = "Action" },
    { "<leader>ct", function() vim.lsp.buf.type_definition() end, desc = "Type Definition" },
    { "<leader>ce", function() vim.g.codeium_enabled = false end, desc = "Disable Codeium" },

    -- Debug group
    { "<leader>d", name = "[D]ebug" },
    { "<leader>dd", function() dapui.toggle() end, desc = "DAP UI Toggle" },
    { "<leader>df", function() dap.continue() end, desc = "Debug: Start/Continue" },
    { "<leader>di", function() dap.step_into() end, desc = "Debug: Step Into" },
    { "<leader>do", function() dap.step_over() end, desc = "Debug: Step Over" },
    { "<leader>dO", function() dap.step_out() end, desc = "Debug: Step Out" },
    { "<leader>dt", function() dap.toggle_breakpoint() end, desc = "Debug: Toggle Breakpoint" },
    { "<leader>db", function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Debug: Set Breakpoint" },

    -- Editor group
    { "<leader>e", name = "[E]ditor" },
    { "<leader>ec", function() tele.colorscheme {} end, desc = "Select colorscheme" },

    -- File group
    { "<leader>f", name = "[F]ile" },
    { "<leader>fs", "<Cmd>w<CR><Esc>", desc = "File Save" },
    { "<leader>fr", function() tele.oldfiles() end, desc = "Show Recent Files" },

    -- Grep/Goto group and LSP subgroup
    { "<leader>g", name = "[g]rep/[g]oto" },
    { "<leader>gS", function() tele.grep_string {} end, desc = "Grep String" },
    { "<leader>gc", function() tele.current_buffer_fuzzy_find(require('telescope.themes').get_cursor({})) end, desc = "Current Buffer" },
    { "<leader>gf", function() tele.find_files(require('telescope.themes').get_dropdown({})) end, desc = "Grep file" },
    { "<leader>gp", function() tele.planets(require('telescope.themes').get_dropdown({})) end, desc = "Search the planets..." },
    { "<leader>gs", function() tele.live_grep(require('telescope.themes').get_dropdown({})) end, desc = "Live Grep" },

    -- LSP Stuff subgroup
    { "<leader>gl", name = "[L]SP Stuff" },
    { "<leader>glr", function() tele.lsp_references(require('telescope.themes').get_cursor({})) end, desc = "References" },
    { "<leader>gli", function() tele.lsp_incoming_calls(require('telescope.themes').get_cursor({})) end, desc = "Incoming Calls for word Under Cursor" },
    { "<leader>glo", function() tele.lsp_outgoing_calls(require('telescope.themes').get_cursor({})) end, desc = "Outgoing Calls for word Under Cursor" },
    { "<leader>gld", function() tele.lsp_document_symbols(require('telescope.themes').get_cursor({})) end, desc = "List Document Symbols in Current Buffer" },
    { "<leader>glw", function() tele.lsp_workspace_symbols(require('telescope.themes').get_dropdown({})) end, desc = "List Document Symbols in Current Workspace" },
    { "<leader>gls", function() tele.lsp_dynamic_workspace_symbols(require('telescope.themes').get_dropdown({})) end, desc = "Dynamically List LSP for all Workspace Symbols" },

    -- Git group
    { "<leader>G", name = "[G]it" },
    { "<leader>Go", function() tele.git_bcommits(require('telescope.themes').get_dropdown({})) end, desc = "Buffer's Commits" },
    { "<leader>Gb", function() tele.git_branches(require('telescope.themes').get_dropdown({})) end, desc = "Branches w/ Log Preview" },
    { "<leader>Gs", function() tele.git_status(require('telescope.themes').get_dropdown({})) end, desc = "Show Current Changes" },
    { "<leader>Gh", function() tele.git_stash(require('telescope.themes').get_dropdown({})) end, desc = "Show Stash Items in Current Repo" },
    { "<leader>Gf", function() tele.git_files(require('telescope.themes').get_dropdown({})) end, desc = "Grep git files" },

    -- Help group
    { "<leader>h", name = "[H]elp" },
    { "<leader>hh", function() tele.help_tags {} end, desc = "Search Help Files" },
    { "<leader>hc", function() tele.commands {} end, desc = "List Available Plugin/User Commands" },
    { "<leader>hk", "<Cmd>Hawtkeys<CR>", desc = "Hawtkeys search" },

    -- Lists group
    { "<leader>l", name = "[L]ists" },
    { "<leader>lb", function() tele.builtin(require('telescope.themes').get_ivy({})) end, desc = "Built-Ins" },
    { "<leader>ld", function() tele.diagnostics(require('telescope.themes').get_dropdown({})) end, desc = "List Diagnostics for all open Buffers" },
    { "<leader>lj", function() tele.jumplist(require('telescope.themes').get_cursor({})) end, desc = "Jumplist" },
    { "<leader>lm", function() tele.marks(require('telescope.themes').get_dropdown({})) end, desc = "List Marks" },

    -- Pickers subgroup
    { "<leader>lp", name = "[P]ickers" },
    { "<leader>lph", function() tele.resume(require('telescope.themes').get_dropdown({})) end, desc = "Results of Previous Picker" },
    { "<leader>lpN", function() tele.pickers(require('telescope.themes').get_dropdown({})) end, desc = "Previous Pickers" },

    -- Lazy subgroup
    { "<leader>lL", name = "[L]azy" },
    { "<leader>lLp", function() require("activate").list_plugins() end, desc = "Plugin Installer" },

    -- Additional Lists subgroups
    { "<leader>ls", function() tele.spell_suggest(require('telescope.themes').get_cursor({})) end, desc = "Spelling Suggestions" },
    { "<leader>ltb", function() tele.current_buffer_tags(require('telescope.themes').get_dropdown({})) end, desc = "Current Buffer Tags" },
    { "<leader>ltt", function() tele.treesitter(require('telescope.themes').get_dropdown({})) end, desc = "Treesitter Functions & Variables" },
    { "<leader>lz", function() tele.symbols {} end, desc = "Symbols" },

    -- Workspace subgroup
    { "<leader>lw", name = "[W]orkspace" },
    { "<leader>lwa", function() vim.lsp.buf.add_workspace_folder() end, desc = "Add Folder to workspace" },
    { "<leader>lwr", function() vim.lsp.buf.remove_workspace_folder() end, desc = "Remove Folder to workspace" },
    { "<leader>lwl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, desc = "Workspace List Folders" },
    { "<leader>lwp", function() require('telescope').extensions.project.project { display_type = 'full' } end, desc = "Project Interface" },

    -- Personal group
    { "<leader>p", name = "[P]ersonal" },

    -- Quickfix group
    { "<leader>q", name = "[Q]uickfix" },
    { "<leader>qq", function() tele.quickfix(require('telescope.themes').get_dropdown({})) end, desc = "Quickfix" },
    { "<leader>qh", function() tele.quickfixhistory(require('telescope.themes').get_dropdown({})) end, desc = "Quickfix History" },
    { "<leader>ql", function() tele.loclist(require('telescope.themes').get_dropdown({})) end, desc = "Current Window Location List" },

    -- Rename
    { "<leader>rn", function() vim.lsp.buf.rename() end, desc = "rename" },

    -- Trouble/TODO group
    { "<leader>t", name = "[T]rouble/TODO" },
    { "<leader>tn", function() require('todo-comments').jump_next() end, desc = "Next TODO" },
    { "<leader>tN", function() require('todo-comments').jump_prev() end, desc = "Previous TODO" },
    { "<leader>tT", "<Cmd>TodoTrouble<CR>", desc = "TodoTrouble" },
    { "<leader>tL", "<Cmd>TodoTelescope<CR>", desc = "TodoTelescope" },
    { "<leader>tt", function() require("trouble").open() end, desc = "Open Trouble" },
    { "<leader>tw", function() require('trouble').open('workspace_diagnostics') end, desc = "Workspace Diagnostics" },
    { "<leader>td", function() require('trouble').open('document_diagnostics') end, desc = "Document Diagnostics" },
    { "<leader>tq", function() require('trouble').open('quickfix') end, desc = "Quickfix" },
    { "<leader>tl", function() require('trouble').open('loclist') end, desc = "Location List" },
    { "<leader>tr", function() require('trouble').open('lsp_references') end, desc = "LSP Reference List" },

    -- Toggle group
    { "<leader>T", name = "[T]oggle" },
    { "<leader>Tc", function() require("obsidian").util.toggle_checkbox() end, desc = "Toggle Checkbox" },

    -- UI group
    { "<leader>u", name = "[U]I" },
    { "<leader>un", function() require('noice').cmd('dismiss') end, desc = "Dismiss Notifications" },
    { "<leader>ue", function() require('noice').cmd('errors') end, desc = "Show errors" },
    { "<leader>ul", function() require('noice').cmd('last') end, desc = "Show last popup" },
    { "<leader>ut", function() require('noice').cmd('disable') end, desc = "Toggle Notifications" },
    { "<leader>uE", function() require('noice').cmd('enable') end, desc = "Enable Noice" },
    { "<leader>us", function() require('noice').cmd('stats') end, desc = "Show Noice Debug Stats" },
    { "<leader>uh", function() require('telescope').extensions.noice.noice(require('telescope.themes').get_dropdown({})) end, desc = "Open message history in telescope" },
    { "<leader>uu", "<Cmd>UndotreeToggle<CR>", desc = "Undotree" },
    { "<leader>uc", function()
      local undercurl_on = true
      local diagnostics = vim.diagnostic.get()
      if undercurl_on then
        vim.diagnostic.set(0, 0, diagnostics, { underline = false })
        print('Undercurl OFF')
      else
        vim.diagnostic.set(0, 0, diagnostics, { underline = true })
        print('Undercurl ON')
      end
      undercurl_on = not undercurl_on
    end, desc = "Under[C]url Toggle" },

    -- Vim Locals group
    { "<leader>v", name = "[V]im Locals" },
    { "<leader>vo", function() tele.vim_options(require('telescope.themes').get_dropdown({})) end, desc = "Vim Options" },
    { "<leader>vr", function() tele.registers(require('telescope.themes').get_ivy({})) end, desc = "Registers" },
    { "<leader>va", function() tele.autocommands(require('telescope.themes').get_ivy({})) end, desc = "Autocommands" },
    { "<leader>vk", function() tele.keymaps(require('telescope.themes').get_ivy({})) end, desc = "Keymaps" },
    { "<leader>vf", function() tele.filetypes(require('telescope.themes').get_dropdown({})) end, desc = "Filetypes" },
    { "<leader>vh", function() tele.highlights(require('telescope.themes').get_dropdown({})) end, desc = "Highlights" },

  }
}
