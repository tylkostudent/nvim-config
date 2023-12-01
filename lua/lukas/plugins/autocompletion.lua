return {
  -- autocompletion
  'hrsh7th/nvim-cmp',
  dependencies = {
    -- snippet engine & its associated nvim-cmp source
    'l3mon4d3/luasnip',
    'saadparwaiz1/cmp_luasnip',

    -- adds lsp completion capabilities
    'hrsh7th/cmp-nvim-lsp',

    -- adds a number of user-friendly snippets
    'rafamadriz/friendly-snippets',
  },
}
