-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "jdtls", "pyright", "intelephense", "kotlin_language_server" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

lspconfig["dartls"].setup {
  capabilities = capabilities,
  cmd = {
    "/opt/flutter/bin/dart",
    "language-server",
    "--protocol=lsp",
    -- "--port=8123",
    -- "--instrumentation-log-file=/Users/robertbrunhage/Desktop/lsp-log.txt",
  },
  filetypes = { "dart" },
  init_options = {
    onlyAnalyzeProjectsWithOpenFiles = false,
    suggestFromUnimportedLibraries = true,
    closingLabels = true,
    outline = false,
    flutterOutline = false,
  },
  settings = {
    dart = {
      -- analysisExcludedFolders = dartExcludedFolders,
      updateImportsOnRename = true,
      completeFunctionCalls = true,
      showTodos = true,
    },
  },
  -- color = { -- show the derived colours for dart variables
  --   enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
  --   background = false, -- highlight the background
  --   background_color = { r = 19, g = 17, b = 24 },
  --   foreground = false, -- highlight the foreground
  --   virtual_text = true, -- show the highlight using virtual text
  --   virtual_text_str = "■", -- the virtual text character to highlight
  -- },
}
