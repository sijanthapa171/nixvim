{
  plugins.luasnip = {
    enable = true;
    settings = {
      enable_autosnippets = true;
      store_selection_keys = "<Tab>";
    };
  };

  # Add custom snippets via Lua configuration
  extraConfigLua = ''
    local ls = require("luasnip")
    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node
    
    -- HTML snippet
    ls.add_snippets("html", {
      s("htm", {
        t({"<!DOCTYPE html>",
           '<html lang="en">',
           "<head>",
           '    <meta charset="UTF-8">',
           '    <meta name="viewport" content="width=device-width, initial-scale=1.0">',
           "    <title>"}),
        i(1, "Document"),
        t({"</title>",
           "</head>",
           "<body>",
           "    "}),
        i(0),
        t({"",
           "</body>",
           "</html>"}),
      }),
    })
    
    -- C snippet
    ls.add_snippets("c", {
      s("main", {
        t({"#include <stdio.h>",
           "",
           "int main() {",
           "    "}),
        i(0),
        t({"",
           "    return 0;",
           "}"}),
      }),
    })
  '';
}
