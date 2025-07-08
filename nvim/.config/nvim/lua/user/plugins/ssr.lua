return {
  "cshuaimin/ssr.nvim",
  config = function()
    local map = require("user.lib").map

    map({ "n", "v" }, "<Leader>sr", require("ssr").open)
  end,
}
