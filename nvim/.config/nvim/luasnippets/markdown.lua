return {
  s("details", {
    t({ "<details>", "<summary>" }),
    i(1, "summary"),
    t({ "</summary>", "" }),
    i(2, ""),
    t({ "", "</details>" }),
  }),
  s("line-length", {
    t({ '<!-- markdownlint-configure-file {"MD013": {"line_length": 100}} -->' }),
  }),
}
