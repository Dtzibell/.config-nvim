return {
  s({ trig = (vim.g.mapleader or ";") .. "sg", snippetType = "autosnippet"},
  t"\\sigma"),
  s({ trig = (vim.g.mapleader or ";") .. "bt", snippetType = "autosnippet"},
  t"\\beta"),
  s({ trig = (vim.g.mapleader or ";") .. "al", snippetType = "autosnippet"},
  t"\\alpha"),
  s({ trig = (vim.g.mapleader or ";") .. "dl", snippetType = "autosnippet"},
  t"\\delta"),
  s({ trig = (vim.g.mapleader or ";") .. "om", snippetType = "autosnippet"},
  t"\\omega"),
  s({ trig = (vim.g.mapleader or ";") .. "pi", snippetType = "autosnippet"},
  t"\\pi"),
  s({ trig = (vim.g.mapleader or ";") .. "Sg", snippetType = "autosnippet"},
  t"\\Sigma"),
  s({ trig = (vim.g.mapleader or ";") .. "Bt", snippetType = "autosnippet"},
  t"\\Beta"),
  s({ trig = (vim.g.mapleader or ";") .. "Al", snippetType = "autosnippet"},
  t"\\Alpha"),
  s({ trig = (vim.g.mapleader or ";") .. "Dl", snippetType = "autosnippet"},
  t"\\Delta"),
  s({ trig = (vim.g.mapleader or ";") .. "Om", snippetType = "autosnippet"},
  t"\\Omega"),
  s({ trig = (vim.g.mapleader or ";") .. "pi", snippetType = "autosnippet"},
  t"\\Pi"),
  s({ trig = "\\sigmaM", snippetType = "autosnippet"},
  t"$\\sigma$"),
  s({ trig = "\\betaM", snippetType = "autosnippet"},
  t[[$\beta$]]),
  s({ trig = "\\alphaM", snippetType = "autosnippet"},
  t[[$\alpha$]]),
  s({ trig = "\\deltaM", snippetType = "autosnippet"},
  t[[$\delta$]]),
  s({ trig = "\\omegaM", snippetType = "autosnippet"},
  t[[$\omega$]]),
  s({ trig = "\\piM", snippetType = "autosnippet"},
  t[[$\pi$]]),
  s({ trig = "\\SigmaM", snippetType = "autosnippet"},
  t[[$\Sigma$]]),
  s({ trig = "\\BetaM", snippetType = "autosnippet"},
  t[[$\Beta$]]),
  s({ trig = "\\AlphaM", snippetType = "autosnippet"},
  t[[$\Alpha$]]),
  s({ trig = "\\DeltaM", snippetType = "autosnippet"},
  t[[$\Delta$]]),
  s({ trig = "\\OmegaM", snippetType = "autosnippet"},
  t[[$\Omega$]]),
  s({ trig = "\\PiM", snippetType = "autosnippet"},
  t[[$\Pi$]]),

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
