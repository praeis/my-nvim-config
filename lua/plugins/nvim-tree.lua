return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- Iconos por tipo de archivo
  cmd = { "NvimTreeToggle", "NvimTreeFocus" }, -- Se carga solo cuando lo invocás
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Abrir/cerrar árbol de archivos" },
  },
  opts = {
    view = {
      width = 30,
    },
    renderer = {
      group_empty = true, -- Agrupa carpetas vacías intermedias en una sola línea
      icons = {
        glyphs = {
          folder = {
            arrow_closed = "▸",
            arrow_open = "▾",
          },
        },
      },
    },
    filters = {
      dotfiles = false, -- Mostrar archivos ocultos (.env, .git, etc.)
    },
    actions = {
      open_file = {
        window_picker = { enable = false }, -- Abre siempre en la ventana actual, sin preguntar
      },
    },
  },
}
