local cmp = require("cmp")

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = function(fallback)
      local n_entries = #cmp.get_entries()
      if n_entries == 1 then
        cmp.confirm({ select = true })
      elseif n_entries > 0 then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    -- TODO: this sometimes hurts you, e.g else vs elseif
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    -- TODO: This wouldn't be necessary if Backspace was consistent
    ["<C-Space>"] = cmp.mapping.complete(),
    -- TODO: Test something that has docs
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-u>"] = cmp.mapping.scroll_docs(4),
  }),
  sources = {
    { name = "buffer", option = { get_bufnrs = vim.api.nvim_list_bufs } },
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  experimental = {
    ghost_text = true,
  },
})
