-- json.lua
return {
  jsonls = {
    filetypes = { "json", "jsonc" },
    settings = {
      json = {
        schemas = require('schemastore').json.schemas(),
        validate = { enable = true },
      }
    }
  }
}
