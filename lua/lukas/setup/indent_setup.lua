vim.cmd([[
  map [a <Plug>(IndentWisePreviousLesserIndent)
  map [\ <Plug>(IndentWisePreviousEqualIndent)
  map [d <Plug>(IndentWisePreviousGreaterIndent)
  map ]a <Plug>(IndentWiseNextLesserIndent)
  map ]\ <Plug>(IndentWiseNextEqualIndent)
  map ]d <Plug>(IndentWiseNextGreaterIndent)
  map [_ <Plug>(IndentWisePreviousAbsoluteIndent)
  map ]_ <Plug>(IndentWiseNextAbsoluteIndent)
  map [% <Plug>(IndentWiseBlockScopeBoundaryBegin)
  map ]% <Plug>(IndentWiseBlockScopeBoundaryEnd)
]])