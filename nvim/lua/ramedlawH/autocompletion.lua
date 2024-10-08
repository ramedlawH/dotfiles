-- Setup nvim-cmp.
local cmp = require'cmp'
-- Include nvim-autopairs: Paranthesis after selecting function or method
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      else
        fallback() --sends an already mapped key (in this case Tab)
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp', keyword_length = 3 },
    { name = 'vsnip', keyword_length = 3 },
    { name = 'path' }
  }, {
    { name = 'buffer', keyword_length = 3 },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- On selecting a method or function, add paranthesis
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- TS Server
require('lspconfig')['ts_ls'].setup {
  capabilities = capabilities
}
-- PHP
require('lspconfig')['intelephense'].setup{
  capabilities = capabilities
}
-- HTML
require('lspconfig')['html'].setup{
  capabilities = capabilities
}
-- CSS
require('lspconfig')['cssls'].setup{
  capabilities = capabilities
}
-- JSON
require('lspconfig')['jsonls'].setup{
  capabilities = capabilities
}
-- Python
require('lspconfig')['pyright'].setup{
  capabilities = capabilities
}
-- Bash
require('lspconfig')['bashls'].setup{
  capabilities = capabilities
}
