require'nvim-treesitter.configs'.setup {
  ensure_installed = { "rust", "go", "c", "lua", "vim", "help" },
  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
  },
}
