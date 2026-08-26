return {
  "NvChad/nvim-colorizer.lua",
  -- event = "BufReadPre" hace que el plugin solo se cargue cuando abres un archivo,
  -- manteniendo el arranque de tu Neovim extremadamente rápido.
  event = "BufReadPre", 
  opts = {
    filetypes = { "*" },
    user_default_options = {
      RGB = true,          -- Detecta formatos cortos como #RGB
      RRGGBB = true,       -- Detecta formatos estándar como #RRGGBB
      names = false,       -- Evita colorear palabras como "Blue" o "red" (puede ser molesto al programar)
      RRGGBBAA = false,    -- Códigos hexadecimales con transparencia
      AARRGGBB = false,
      rgb_fn = true,       -- Colorea funciones CSS como rgb()
      hsl_fn = true,       -- Colorea funciones CSS como hsl()
      css = false, 
      css_fn = false,
      -- mode = "background" pinta el fondo del texto. 
      -- Otras opciones: "foreground" (pinta la letra) o "virtualtext" (pone un cuadrito al lado)
      mode = "background", 
      tailwind = false, 
    },
  },
}
