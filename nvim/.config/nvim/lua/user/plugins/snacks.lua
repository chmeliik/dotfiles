---@module "snacks"

return {
  "folke/snacks.nvim",
  -- https://github.com/folke/snacks.nvim/tree/main?tab=readme-ov-file#-installation
  priority = 1000,
  lazy = false,
  opts = {
    picker = {},
    explorer = {},
  },
  keys = {
    -- stylua: ignore start
    -- Top Pickers & Explorer
    { "<leader>fd", function() Snacks.picker.files() end,                 desc = "Find Files" },
    { "<leader>ls", function() Snacks.picker.buffers() end,               desc = "Buffers" },
    { "<leader>rg", function() Snacks.picker.grep() end,                  desc = "Grep" },
    { "<leader>E",  function() Snacks.explorer() end,                     desc = "File Explorer" },
    -- find
    { "<leader>ff", function() Snacks.picker.smart() end,                 desc = "Smart Find Files" },
    { "<leader>fg", function() Snacks.picker.git_files() end,             desc = "Find Git Files" },
    { "<leader>fr", function() Snacks.picker.recent() end,                desc = "Recent" },
    -- git
    { "<leader>gl", function() Snacks.picker.git_log() end,               desc = "Git Log" },
    { "<leader>gb", function() Snacks.picker.git_log_line() end,          desc = "Git Log Line" },
    { "<leader>gd", function() Snacks.picker.git_diff() end,              desc = "Git Diff (Hunks)" },
    -- grep
    { "<leader>/",  function() Snacks.picker.lines() end,                 desc = "Buffer Lines" },
    { "<leader>*",  function() Snacks.picker.grep_word() end,             desc = "Visual selection or word", mode = { "n", "x" } },
    -- diagnostics
    { "<leader>q",  function() Snacks.picker.diagnostics_buffer() end,    desc = "Buffer Diagnostics" },
    { "<leader>Q",  function() Snacks.picker.diagnostics() end,           desc = "Diagnostics" },
    -- search
    { "<leader>S",  function() Snacks.picker.pickers() end,               desc = "Snacks Pickers" },
    { "<leader>sh", function() Snacks.picker.help() end,                  desc = "Help Pages" },
    { "<leader>sm", function() Snacks.picker.man() end,                   desc = "Man Pages" },
    { "<leader>si", function() Snacks.picker.icons() end,                 desc = "Icons" },
    { "<leader>sk", function() Snacks.picker.keymaps() end,               desc = "Keymaps" },
    { "<leader>sq", function() Snacks.picker.qflist() end,                desc = "Quickfix List" },
    -- LSP
    { "<leader>ss", function() Snacks.picker.lsp_symbols() end,           desc = "LSP Symbols" },
    { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
    { "gd",         function() Snacks.picker.lsp_definitions() end,       desc = "Goto Definition" },
    { "gt",         function() Snacks.picker.lsp_type_definitions() end,  desc = "Goto Type Definition" },
    { "gr",         function() Snacks.picker.lsp_references() end,        desc = "References",               nowait = true },
    { "gi",         function() Snacks.picker.lsp_implementations() end,   desc = "Goto Implementation" },
    { "gD",         function() Snacks.picker.lsp_declarations() end,      desc = "Goto Declaration" },
  },
}
