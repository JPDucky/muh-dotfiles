-- yaml.lua
return {
  -- YAML Language Server for general YAML, Docker Compose, and Kubernetes
  yamlls = {
    filetypes = { "yaml", "yaml.docker-compose", "yml" },
    settings = {
      yaml = {
        schemas = {
          ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose*.yml",
          ["https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/ansible.json#/$defs/playbook"] = "*playbook*.yml",
          ["https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/ansible.json#/$defs/tasks"] = "tasks/*.yml",
          ["https://json.schemastore.org/github-workflow.json"] = ".github/workflows/*.yml",
          ["https://json.schemastore.org/kustomization.json"] = "kustomization.yaml",
          ["https://raw.githubusercontent.com/kubernetes/kubernetes/master/api/openapi-spec/swagger.json"] = "*kubernetes*.yml"
        },
        format = { enable = true },
        validate = true,
        completion = true,
        hover = true
      }
    }
  },

  -- Ansible Language Server for Ansible-specific features
  ansiblels = {
    filetypes = { "yaml.ansible" },
    settings = {
      ansible = {
        python = {
          interpreterPath = "python3"
        },
        validation = {
          enabled = true,
          lint = {
            enabled = true,
            path = "ansible-lint"
          }
        },
        completion = {
          provideRedirectModules = true,
          provideModuleOptionAliases = true
        }
      }
    }
  }
}
