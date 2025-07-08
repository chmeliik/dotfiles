return {
  { "folke/lazydev.nvim", ft = "lua", opts = {} },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
      {
        "L3MON4D3/LuaSnip",
        version = "2.*",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load({
            -- exclude the generic snippets (doesn't disable lanugage-specific ones)
            exclude = { "all" },
          })
          require("luasnip.loaders.from_lua").lazy_load()
        end,
      },
      { "windwp/nvim-autopairs", opts = {} },
    },
    config = function()
      local kind_icons = {
        Text = "",
        Method = "",
        Function = "󰊕",
        Constructor = "",
        Field = "",
        Variable = "󰫧",
        Class = "",
        Interface = "",
        Module = "",
        Property = "",
        Unit = "",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "",
        Event = "",
        Operator = "",
        TypeParameter = "",
      }

      local cmp = require("cmp")
      local luasnip = require("luasnip")

      local function tab(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.jumpable(1) then
          luasnip.jump(1)
        else
          fallback()
        end
      end

      local function shifttab(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end

      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping(tab, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(shifttab, { "i", "s" }),
          ["<CR>"] = cmp.mapping.confirm(),
          ["<C-CR>"] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace,
          }),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-u>"] = cmp.mapping.scroll_docs(-4),
          ["<C-d>"] = cmp.mapping.scroll_docs(4),
        }),
        sources = {
          { name = "lazydev", group_index = 0 },
          { name = "nvim_lsp", group_index = 1 },
          { name = "luasnip", group_index = 1 },
          { name = "buffer", group_index = 2 },
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        formatting = {
          format = function(_, vim_item)
            vim_item.kind =
              string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
            return vim_item
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        experimental = {
          ghost_text = true,
        },
      })

      cmp.event:on(
        "confirm_done",
        require("nvim-autopairs.completion.cmp").on_confirm_done()
      )

      for _, search_mode in pairs({ "/", "?" }) do
        cmp.setup.cmdline(search_mode, {
          mapping = cmp.mapping.preset.cmdline(),
          sources = {
            { name = "buffer" },
          },
        })
      end

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "cmdline" },
          { name = "path" },
        },
      })
    end,
  },
}
