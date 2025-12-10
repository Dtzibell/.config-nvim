return {
  s({trig = (vim.g.mapleader or ";") .. "bg", snippetType = "autosnippet"},
    fmta([[
    \begin{<>}
    \end{<>}
    ]], {
      i(1),
      rep(1),
    }
)
),
  s({trig = (vim.g.mapleader or ";") .. "m", snippetType = "autosnippet"},
    fmta([[
    $<>$
    ]], {
      i(1),
    }
)
),
  s({trig = (vim.g.mapleader or ";") .. "vb", snippetType = "autosnippet"},
    fmta([[
    \verb^<>^
    ]], {
      i(1),
    }
)
),
  s({trig = (vim.g.mapleader or ";") .. "M", snippetType = "autosnippet"},
    fmta([[
    \[<>\]
    ]], {
      i(1),
    }
)
),
  s({trig = (vim.g.mapleader or ";") .. "frac", snippetType = "autosnippet"},
    fmta([[
    \frac{<>}{<>}
    ]], {
      i(1),
      i(2),
    }
)
),
  s({trig = (vim.g.mapleader or ";") .. "log", snippetType = "autosnippet"},
    fmta([[
    \log{<>}
    ]], {
      i(1),
    }
)
),
  s({trig = (vim.g.mapleader or ";") .. "ln", snippetType = "autosnippet"},
    fmta([[
    \ln{<>}
    ]], {
      i(1),
    }
)
),
  s({trig = "\\log{_", snippetType = "autosnippet"},
    fmta([[
    \log_{<>}{<>
    ]], {
      i(1),
      i(2),
    }
)
),
  s({trig = (vim.g.mapleader or ";") .. "sup", snippetType = "autosnippet", wordTrig = false},
    fmta([[
    ^{<>}
    ]], {
      i(1),
    }
)
),
  s({trig = (vim.g.mapleader or ";") .. "sub", snippetType = "autosnippet", wordTrig = false},
    fmta([[
    _{<>}
    ]], {
      i(1),
    }
)
),
  s({trig = (vim.g.mapleader or ";") .. "pgr", snippetType = "autosnippet"},
    fmta([[
    \paragraph{<>}\mbox{}
    ]], {
      i(1),
    }
)
),
  s({trig = (vim.g.mapleader or ";") .. "sum", snippetType = "autosnippet"},
    fmta([[
    \sum_{<>}^{<>}{<>}
    ]], {
      i(1),
      i(2),
      i(3),
    }
)
),
  s({trig = (vim.g.mapleader or ";") .. "eq", snippetType = "autosnippet"},
    fmta([[
    \equiv
    ]], {
    }
)
),
  s({trig = (vim.g.mapleader or ";") .. "ra", snippetType = "autosnippet"},
    fmta([[
    \rightarrow
    ]], {
    }
)
),
  s({trig = (vim.g.mapleader or ";") .. "la", snippetType = "autosnippet"},
    fmta([[
    \leftarrow
    ]], {
    }
)
),
  s({trig = (vim.g.mapleader or ";") .. "fig", snippetType = "autosnippet"},
    fmta([[
    \begin{figure}
      \centering
      \includegraphics[width=<>\textwidth]{<>}
      \caption{<>}
      \label{fig:<>}
    \end{figure}
    ]], {
      i(1),
      i(2),
      i(3),
      i(4),
    }
)
),
}
