return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "pyright",
          "ruff",
          "html",
          "cssls",
          "ts_ls",
          "jsonls",
          "emmet_ls",
          "dockerls",
          "docker_compose_language_service"
        },
      })
    end,
  },

  {
  "neovim/nvim-lspconfig",
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local on_attach = function(_, bufnr)
      local opts = { buffer = bufnr }
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    end

    -- Lua
    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          telemetry = { enable = false },
        },
      },
    })

    -- Pyright
    vim.lsp.config("pyright", {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "basic",
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
          },
        },
      },
    })

    -- Ruff
    vim.lsp.config("ruff", {
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- HTML
    vim.lsp.config("html", {
      capabilities = capabilities,
      on_attach = on_attach,
    })

-- CSS
    vim.lsp.config("cssls", {
      capabilities = capabilities,
      on_attach = on_attach,
    })

-- JavaScript / TypeScript
    vim.lsp.config("ts_ls", {
      capabilities = capabilities,
      on_attach = on_attach,
    })

-- JSON
    vim.lsp.config("jsonls", {
      capabilities = capabilities,
      on_attach = on_attach,
    })

-- Emmet (HTML / CSS)
    vim.lsp.config("emmet_ls", {
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = {
        "html",
        "css",
        "javascript",
        "javascriptreact",
        "typescriptreact",
      },
    })

-- Dockerfile
    vim.lsp.config("dockerls", {
      capabilities = capabilities,
      on_attach = on_attach,
    })

-- docker-compose.yml
    vim.lsp.config("docker_compose_language_service", {
      capabilities = capabilities,
      on_attach = on_attach,
    })
  end,
}
}
