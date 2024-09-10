return {
  {
    "goolord/alpha-nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- config = function()
    --   require("alpha").setup(require("alpha.themes.dashboard").config)
    -- end,
  },
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
      -- My Changes
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = ev.buf }

          -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "<leader>sd", vim.lsp.buf.hover, { buffer = ev.buf, desc = "Search Docs" })
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = ev.buf, desc = "Code actions" })
          -- vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = ev.buf, desc = "Rename" })
          vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
        end,
      })
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
      },
    },
  },
  -- {
  --   "robertbrunhage/dart-tools.nvim",
  --   dependencies = {
  --     "hrsh7th/cmp-nvim-lsp",
  --
  --     { "j-hui/fidget.nvim", tag = "legacy" },
  --     -- support for dart hot reload on save
  --     "RobertBrunhage/dart-tools.nvim",
  --   },
  -- },
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = function()
      -- require("flutter-tools").setup {
      --   lsp = {
      --     color = { -- show the derived colours for dart variables
      --       enabled = false, -- only supported on flutter >= 2.10
      --       background = false, -- highlight the background
      --       background_color = { r = 19, g = 17, b = 24 },
      --       foreground = false, -- highlight the foreground
      --       virtual_text = true, -- show the highlight using virtual text
      --       virtual_text_str = "■", -- the virtual text character to highlight
      --     },
      --     -- on_attach = require("nvchad.configs.lspconfig").on_attach,
      --     -- capabilities = require("nvchad.configs.lspconfig").capabilities,
      --   },
      -- }
      require("flutter-tools").setup {}
    end,
  },
  {
    {
      "eatgrass/maven.nvim",
      cmd = { "Maven", "MavenExec" },
      dependencies = "nvim-lua/plenary.nvim",
      config = function()
        require("maven").setup {
          executable = "./mvnw",
        }
      end,
    },
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },
  -- {
  -- 'weilbith/nvim-code-action-menu',
  --   cmd = {"CodeActionMenu"}
  -- },
  {
    "ahmedkhalf/project.nvim",
    lazy = false,
    config = function()
      require("project_nvim").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
  },
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-telescope/telescope.nvim",
      "mfussenegger/nvim-dap-python",
      "sharkdp/fd",
    },
    opts = {
      -- Your options go here
      -- name = "venv",
      -- auto_refresh = false
    },
    -- event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
    lazy = true,
    keys = {
      -- Keymap to open VenvSelector to pick a venv.
      { "<leader>vs", "<cmd>VenvSelect<cr>" },
      -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
      { "<leader>vc", "<cmd>VenvSelectCached<cr>" },
    },
  },
}
