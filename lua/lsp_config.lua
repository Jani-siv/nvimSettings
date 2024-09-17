-- ~/.config/nvim/lua/lsp_config.lua

-- Set up nvim-cmp completion
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
  }, {
    { name = 'buffer' },
  })
})

-- Set up language servers using lspconfig
local lspconfig = require'lspconfig'
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Lua (sumneko_lua)
lspconfig.lua_ls.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell Lua you're using Lua 5.1 (most likely)
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' },  -- Recognize the `vim` global variable
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
    },
  },
}

-- Python (pyright)
lspconfig.pyright.setup{
  capabilities = capabilities,
}

-- Shell Script (bash-language-server)
lspconfig.bashls.setup{
  capabilities = capabilities,
}

-- C++ (clangd)
lspconfig.clangd.setup{
  capabilities = capabilities,
}

