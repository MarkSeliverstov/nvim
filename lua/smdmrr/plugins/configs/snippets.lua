local ls = require("luasnip")

local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

vim.keymap.set({ "i", "s" }, "<C-k>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-j>", function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, { silent = true })

-- ---
-- title: ""
-- summary: ""
-- tags: []
-- date: ""
-- image: ""
-- ---
ls.add_snippets("mdx", {
  s("metadata", {
    t({ "---", "" }),
    t("title: \""), i(1), t("\""),
    t({"",""}),
    t("summary: \""), i(2), t("\""),
    t({"",""}),
    t("tags: [\""), i(3), t("\"]"),
    t({"",""}),
    t("date: \""), i(4), t("\""),
    t({"",""}),
    t("image: \""), i(5), t("\""),
    t({"",""}),
    t("---"),
  }),
})
