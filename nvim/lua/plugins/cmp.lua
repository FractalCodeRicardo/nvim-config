return {
  {
    'hrsh7th/cmp-nvim-lsp',
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp-signature-help',
    },
    config = function()
      local cmp = require 'cmp'

      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<Tab>'] = cmp.mapping(function(fallback)
            if vim.fn.exists('b:_codeium_completions') ~= 0 then
              -- accept codeium completion if visible
              vim.fn['codeium#Accept']()
              fallback()
              return
            end

            if cmp.visible() then
              if cmp.get_selected_entry() then
                -- Confirm the currently selected item
                cmp.confirm({ select = true })
              else
                -- Select the next item and confirm it
                cmp.select_next_item()
                cmp.confirm({ select = true })
              end
            else
              fallback() -- If completion is not visible, fallback to default behavior
            end
          end, { 'i', 's' }),

        }),
        sources = cmp.config.sources({
            { name = "codeium" },
            { name = 'nvim_lsp' },
            { name = 'nvim_lsp_signature_help' }
          },
          {
            { name = 'buffer' },
            { name = 'path' }
          })
      })
    end
  },
  {
    'windwp/nvim-autopairs',
    config = function()
      require("nvim-autopairs").setup({})
    end
  }
}
