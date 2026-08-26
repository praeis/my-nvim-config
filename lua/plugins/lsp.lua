return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "hrsh7th/cmp-nvim-lsp" },
    config = function()
      -- Tabla de servidores: agregar un lenguaje nuevo es solo sumar una entrada aquí
      local servers = {
        gopls = {
          filetypes = { "go", "gomod", "gowork", "gotmpl" },
          root_markers = { "go.work", "go.mod", ".git" },
        },
        -- rust_analyzer = {
        --   filetypes = { "rust" },
        --   root_markers = { "Cargo.toml", ".git" },
        -- },
      }

      -- Capabilities compartidas: le informan al LSP lo que nvim-cmp soporta
      -- (snippets, resolve, etc.), necesario para que el completado funcione bien
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      for name, cfg in pairs(servers) do
        vim.lsp.config[name] = vim.tbl_deep_extend("force", cfg, {
          cmd = cfg.cmd or { name },
          capabilities = capabilities,
        })
      end

      require("mason-lspconfig").setup({
        ensure_installed = vim.tbl_keys(servers),
        -- Control explícito: nosotros llamamos vim.lsp.enable() a continuación
        automatic_enable = false,
      })

      -- Activa todos los servidores definidos en la tabla `servers`
      vim.lsp.enable(vim.tbl_keys(servers))
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      -- Atajos de teclado cuando el LSP se conecte
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
        callback = function(args)
          local opts = { buffer = args.buf }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)      -- Ir a definición
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)          -- Ver documentación
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)  -- Renombrar variable

          -- VER Y NAVEGAR ERRORES
          vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- Muestra el mensaje de error completo en una ventana flotante sobre el cursor
          vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- Salta al siguiente error del archivo
          vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- Salta al error anterior del archivo
          vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts) -- Abre una lista desplegable (loclist) con todos los errores del archivo actual
        end,
      })
    end,
  },
}
