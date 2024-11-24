-- terraform.lua
return {
  terraformls = {
    filetypes = { "terraform", "tf", "terraform-vars" },
    settings = {
      terraform = {
        experimentalFeatures = {
          validateOnSave = true,
        }
      }
    }
  }
}
