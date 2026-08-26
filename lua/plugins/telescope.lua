return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- Ordenador nativo en C: búsqueda mucho más rápida (requiere gcc o clang)
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  cmd = "Telescope",
  keys = {
    -- Archivos
    { "<leader>ff", "<cmd>Telescope find_files<CR>",  desc = "Buscar archivos" },
    { "<leader>fr", "<cmd>Telescope oldfiles<CR>",    desc = "Archivos recientes" },

    -- Contenido
    { "<leader>fg", "<cmd>Telescope live_grep<CR>",   desc = "Buscar texto en el proyecto" },
    { "<leader>fw", "<cmd>Telescope grep_string<CR>", desc = "Buscar palabra bajo el cursor" },

    -- Neovim
    { "<leader>fb", "<cmd>Telescope buffers<CR>",     desc = "Buffers abiertos" },
    { "<leader>fh", "<cmd>Telescope help_tags<CR>",   desc = "Ayuda de Neovim" },

    -- LSP (complementa tus atajos existentes)
    { "<leader>fd", "<cmd>Telescope diagnostics<CR>", desc = "Diagnósticos del proyecto" },
    { "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", desc = "Símbolos del archivo" },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        -- Archivos y carpetas que nunca aparecen en la búsqueda
        file_ignore_patterns = { "%.git/", "node_modules/", "vendor/" },

        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- Navegar arriba
            ["<C-j>"] = actions.move_selection_next,     -- Navegar abajo
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- Enviar a quickfix
            ["<Esc>"] = actions.close,                   -- Cerrar con Escape (modo inserción)
          },
        },
      },
      pickers = {
        find_files = {
          hidden = true, -- Incluye archivos ocultos (.env, .gitignore, etc.)
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case", -- Mayúsculas solo si escribís en mayúsculas
        },
      },
    })

    -- Activa el ordenador nativo para mayor velocidad
    telescope.load_extension("fzf")
  end,
}
