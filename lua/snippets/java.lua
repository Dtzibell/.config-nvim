function comment_args (args, parent)
  table_of_args = vim.split(args[1][1], ",", {trimempty = true})
  
  for i,v in ipairs(table_of_args) do
    table_of_args[i] = "//@param " .. string.gsub(table_of_args[i], "^ ", "")
  end
  return table_of_args
end


return {
  s({trig = (vim.g.mapleader or ";") .. "init", snippetType = "autosnippet"},
    fmta([[
    package com.dtzi.app,
    
    public class <> {
    \tpublic static void main (String[] args) {
    \t}
    }]], {
    i(1, "App")
    }, {
    indent_string = [[\t]]
    })
  ),
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
  )
}
