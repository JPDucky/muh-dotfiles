-- docker.lua
return {
  dockerls = {
    filetypes = { "dockerfile" },
    settings = {
      docker = {
        languageserver = {
          diagnostics = {
            deprecatedMaintainer = true,
            directiveCasing = true,
            emptyContinuationLine = true,
            instructionCasing = true,
            instructionCmdNoExecution = true,
            instructionEntrypointArraySum = true,
            instructionHealthcheckArray = true,
            instructionJSONInSingleQuotes = true
          }
        }
      }
    }
  }
}
