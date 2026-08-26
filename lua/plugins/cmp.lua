return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp", -- Lee las sugerencias del LSP
    "hrsh7th/cmp-buffer",   -- Lee palabras del archivo actual
    "hrsh7th/cmp-path",     -- Completa rutas de archivos
  },
  config = function()
    local cmp = require("cmp")

    cmp.setup({
      snippet = {
        -- Motor de snippets nativo de Neovim (0.10+), sin depender de LuaSnip
        expand = function(args)
          vim.snippet.expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- Abre el menú manualmente
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- 'Enter' para aceptar sugerencia
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item() -- NAVEGAR abajo si el menú está abierto
          else
            fallback() -- si no hay menú, Tab se comporta normalmente (indentar, etc.)
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item() -- NAVEGAR arriba si el menú está abierto
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
      }),
    })
  end,
}
