-- NOTE: this file is for saving vim vars

-- NOTE: GLOBALS
vim.g.have_nerd_font = true
vim.g.netrw_keepdir = 0

-- NOTE: vars, idk
vim.opt.scrolloff = 14
vim.opt.wrap = false
vim.opt.number = true
--vim.opt.relativenumber = true
vim.opt.mouse = 'a'

vim.opt.showmode = false

vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = 'yes'

-- vim.opt.list = true
-- vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.inccommand = 'split'

vim.opt.cursorline = true
vim.opt.scrolloff = 10



-- disabled --
-- vim.g.netrw_banner = 0
-- vim.g.netrw_liststyle = 3
-- vim.g.netrw_browse_split = 4
-- vim.g.netrw_altv = 1
-- vim.g.netrw_winsize = 25


-- Filetype detection for docker-compose and ansible files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = {
    "docker-compose*.{yaml,yml}",
    "*compose*.{yaml,yml}",
  },
  callback = function()
    vim.opt_local.filetype = "yaml.docker-compose"
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = {
    "*playbook*.{yaml,yml}",
    "*/playbooks/*.{yaml,yml}",
    "*/roles/*/tasks/*.{yaml,yml}",
    "*/roles/*/handlers/*.{yaml,yml}",
    "*/roles/*/vars/*.{yaml,yml}",
    "*/inventory/*.{yaml,yml}"
  },
  callback = function()
    vim.opt_local.filetype = "yaml.ansible"
  end,
})
