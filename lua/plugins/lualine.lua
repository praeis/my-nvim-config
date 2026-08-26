return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = "VeryLazy",
  opts = {
    options = {
      theme = "iceberg_dark"
    },
    sections = {
      lualine_c = {
        {
          'filename',
          file_status = true,
          path = 3, -- Ruta relativa
        }
      }
    }
  },
}
