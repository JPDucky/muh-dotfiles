-- rust.lua
return {
  rust_analyzer = {
    settings = {
      ['rust-analyzer'] = {
        checkOnSave = {
          command = "clippy"
        },
        inlayHints = {
          bindingModeHints = {
            enable = true
          },
          typeHints = {
            enable = true,
            hideClosureInitialization = false,
            hideNamedConstructor = false
          },
          chainingHints = {
            enable = true
          },
          parameterHints = {
            enable = true
          }
        }
      }
    }
  }
}
