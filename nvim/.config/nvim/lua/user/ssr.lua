local ssr = require("ssr")

local map = require("user.lib").map

map({ "n", "v" }, "<Leader>sr", ssr.open)
