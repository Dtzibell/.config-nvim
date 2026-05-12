local h = require("snippets._helpers")
local s, fmta, i, rep, f, d, t, ai, c = h.s, h.fmta, h.i, h.rep, h.f, h.d, h.t, h.ai, h.c

function comment_args (args, parent)
  table_of_args = vim.split(args[1][1], ",", {trimempty = true})
  
  for i,v in ipairs(table_of_args) do
    table_of_args[i] = "//@param " .. string.gsub(table_of_args[i], "^ ", "")
  end
  return table_of_args
end


return {
  s({trig = (vim.g.mapleader or ";") .. "fn", snippetType = "autosnippet"},
    fmta([[
    //<> <>function
    <>
    <>
    <> <><> <> (<>) {
      <>
    }
      ]], {
        rep(2),
        rep(3),
        f(comment_args, {6}),
        d(1,
          function (args)
            type = args[1][1]
            if type ~= "void" then
              return sn(nil, { t("//returns " .. type .. " "), rep(ai(7, 0, 1)) })
            else return sn(nil, { t("//returns nothing") })
            end
          end, {4}),
        c(2, {
          t"public",
          t"private"
        }),
        c(3, {
          t"",
          t"static "
        }),
        i(4, "type"),
        i(5, "name"),
        i(6, "args"),
        d(7, function(args) 
              local type = args[1][1] 
              if type ~= "void" then
                return sn(nil, fmta([[ 
                <> <>; 
                \treturn <>; 
                ]], 
                {rep(ai(4)), i(1, "return_value"), 
                rep(1)}, 
                {indent_string = [[\t]]})) 
              else return sn(nil, t"")
              end 
            end, {4})
      }
    )
  ),
  s({trig = (vim.g.mapleader or ";") .. "prt", snippetType = "autosnippet"},
    fmta([[
    IO.println(<>);
      ]], {
        i(1),
      })
    ),
}
