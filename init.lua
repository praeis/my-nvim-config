require("config.lazy")

-------------------------------------------------------------------------------
-- 1. OPCIONES GENERALES (vim.opt)
-------------------------------------------------------------------------------
vim.opt.number = true          -- Muestra el número de línea
vim.opt.relativenumber = true  -- Números de línea relativos (ideal para saltos rápido con hjkl)
vim.opt.mouse = "a"            -- Habilita el uso del ratón
vim.opt.ignorecase = true      -- Búsqueda insensible a mayúsculas/minúsculas...
vim.opt.smartcase = true       -- ...a menos que uses una mayúscula en la búsqueda
vim.opt.hlsearch = false       -- No mantener resaltadas las búsquedas anteriores
vim.opt.wrap = false           -- No ajustar texto largo a la siguiente línea visual
vim.opt.termguicolors = true   -- Colores reales de 24-bit en la terminal
vim.opt.signcolumn = "yes"     -- Mantiene la columna de signos (para git/LSP)
vim.opt.scrolloff = 8          -- Mantiene 8 líneas visibles arriba/abajo al desplazar
vim.opt.updatetime = 50        -- Respuesta más rápida para autocompletado y eventos

-- Indentación (Tabulaciones de 2 espacios)
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Portapapeles (comparte el portapapeles de Neovim con el sistema operativo)
vim.opt.clipboard = "unnamedplus"

vim.opt.list = true
vim.opt.listchars = { 
  leadmultispace = "--", 
  tab = "--",
}
vim.api.nvim_set_hl(0, "Whitespace", { fg = "#393c4d" })

-------------------------------------------------------------------------------
-- 2. ATAJOS (Keymaps)
-------------------------------------------------------------------------------
local keymap = vim.keymap.set

-- Navegación rápida entre ventanas divididas (Splits)
keymap("n", "<C-h>", "<C-w>h", { desc = "Mover a la ventana izquierda" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Mover a la ventana inferior" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Mover a la ventana superior" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Mover a la ventana derecha" })

-- Guardar y cerrar rápidamente
keymap("n", "<leader>w", ":w<CR>", { desc = "Guardar archivo" })
keymap("n", "<leader>q", ":q<CR>", { desc = "Cerrar ventana" })

-- Mover líneas seleccionadas arriba/abajo en modo Visual
keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Mover línea hacia abajo" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Mover línea hacia arriba" })

-- Navegación rápida entre buffers
keymap("n", "<S-l>", ":bnext<CR>", { desc = "Buffer siguiente" })
keymap("n", "<S-h>", ":bprevious<CR>", { desc = "Buffer anterior" })
