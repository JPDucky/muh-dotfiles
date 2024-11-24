-- In your plugin config:
return {
  -- Docker compose and Dockerfile specific
  {
    "crusj/structrue-go.nvim",
    branch = "main",
    dependencies = { "crusj/hierarchy-tree-go.nvim" },
  },

  -- Ansible specific
  {
    "pearofducks/ansible-vim",
    ft = { "yaml.ansible" },
    config = function()
      vim.g.ansible_unindent_after_newline = 1
      vim.g.ansible_extra_keywords_highlight = 1
      vim.g.ansible_with_keywords_highlight = 1
      vim.g.ansible_template_syntaxes = {
        ["*.json.j2"] = "json",
        ["*.yml.j2"] = "yaml",
        ["*.yaml.j2"] = "yaml",
        ["*.xml.j2"] = "xml"
      }
    end
  },

  -- Terraform specific
  { 
    "hashivim/vim-terraform",
    ft = { "terraform", "tf", "terraform-vars" }
  },
}
