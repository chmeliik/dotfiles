---@param n integer
local function spaces(n)
  vim.opt_local.shiftwidth = n
end

---@param width integer
local function tabs(width)
  vim.opt_local.tabstop = width or 8
  vim.opt_local.shiftwidth = 0
  vim.opt_local.expandtab = false
end

-- stylua: ignore
local ft_settings = {
  go = function() tabs(4) end,
  make = function() tabs(4) end,
  gitconfig = function() tabs(4) end,
  haskell = function() spaces(2) end,
  json = function() spaces(2) end,
  lua = function() spaces(2) end,
  xml = function() spaces(2) end,
  yaml = function() spaces(2) end,
  markdown = function() spaces(2) end,
  javascript = function() spaces(2) end,
  typescript = function() spaces(2) end,
}

vim.api.nvim_create_augroup("user.filetype", {})
vim.api.nvim_create_autocmd("FileType", {
  group = "user.filetype",
  callback = function(event)
    local settings = ft_settings[event.match]
    if settings then
      settings()
    end
  end,
})
