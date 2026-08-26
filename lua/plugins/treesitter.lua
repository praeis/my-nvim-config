return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install({ "go", "gomod", "gowork", "gosum", "lua" })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "go", "gomod", "gowork", "gosum", "lua" },
      callback = function()
        vim.treesitter.start()
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
