local function setup()
  require("nvim-treesitter.configs").setup {
    auto_install = true,
    highlight = {
      enable = true,
      disable = { "make" },
    },
    indent = { enable = true },
  }
end

return {
  setup = setup,
}
