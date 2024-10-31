return {
  lua_ls = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        globals = {'vim', 'use'},
        disable = {"lowercase-global", "undefined-global"},
      },
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
        maxPreload = 1000,
        preloadFileSize = 1000,
        checkThirdParty = true,
      },
      telemetry = { enable = false },
      completion = {
        callSnippet = "Replace",
        keywordSnippet = 'Disable',
        showWord = true,
        displayContext = 5,
        preferred = true,
        autoRequire = true,
      },
      hint = {
        enabled = true,
      },
      format = {
        enable = true,
        defaultConfig = {
          indent_style = "space",
          indent_size = "2",
          continuation_indent_size = "2",
        },
      },
    },
  },
}
