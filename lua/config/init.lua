local g = vim.g

-- Plugin configuration
PLUGINS = {
  coq = {
    enabled = false,
  },
  nvim_cmp = {
    enabled = true,
  },
  fzf_lua = {
    enabled = false,
  },
  telescope = {
    enabled = true,
  },
  nvim_dap = {
    enabled = true,
  },
  vimspector = {
    enabled = false,
  },
}

-- Disable some builtin vim plugins
local disabled_built_ins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "matchparen",
  "tar",
  "tarPlugin",
  "rrhelper",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
  g["loaded_" .. plugin] = 1
end
