return {
  html = {
    filetypes = { "html" },
    init_options = {
      configurationSection = { "html", "css", "javascript" },
      embeddedLanguages = {
        css = true,
        javascript = true
      },
      provideFormatter = true
    },
    settings = {
      html = {
        format = {
          indentInnerHtml = true,
          wrapLineLength = 80,
          wrapAttributes = 'auto',
          templating = true,
          unformatted = nil
        },
        hover = {
          documentation = true,
          references = true
        },
        completion = {
          attributeDefaultValue = "doublequotes"
        },
        validate = {
          scripts = true,
          styles = true
        }
      }
    }
  }
}
