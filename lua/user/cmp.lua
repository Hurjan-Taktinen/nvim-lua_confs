local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
    return
end

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

require("luasnip/loaders/from_vscode").lazy_load({
    paths = {
        "~/.local/share/nvim/site/pack/packer/start/friendly-snippets",
        "~/.config/nvim/lua/user/my_snippets" }}
)

local kind_icons = {
    Text = " ",
    Method = "m ",
    Function = " ",
    Constructor = " ",
    Field = " ",
    Variable = " ",
    Class = " ",
    Interface = " ",
    Module = " ",
    Property = " ",
    Unit = "  ",
    Value = " ",
    Enum = " ",
    Keyword = " ",
    Snippet = " ",
    Color = " ",
    File = " ",
    Reference = " ",
    Folder = " ",
    EnumMember = " ",
    Constant = " ",
    Struct = " ",
    Event = " ",
    Operator = " ",
    TypeParameter = " ",
}
-- find more here: https://www.nerdfonts.com/cheat-sheet

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    mapping = {
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-e>"] = cmp.mapping.select_prev_item(),
        -- ["<Tab>"] = cmp.mapping.select_next_item(),
        -- ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        -- ["<C-e>"] = cmp.mapping({
        --     i = cmp.mapping.abort(),
        --     c = cmp.mapping.close(),
        -- }),
        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        -- ['<Tab>'] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                print('AWAW 1')
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                print('AWAW 2')
                luasnip.expand_or_jump()
            elseif has_words_before() then
                print('AWAW 3')
                cmp.complete()
            else
                print('AWAW 4')
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    },
     -- ORIGINAL ORDER
      -- comparators = {
      --   cmp.config.compare.offset,
      --   cmp.config.compare.exact,
      --   cmp.config.compare.score,
      --   cmp.config.compare.recently_used,
      --   cmp.config.compare.kind,
      --   cmp.config.compare.sort_text,
      --   cmp.config.compare.length,
      --   cmp.config.compare.order,
      -- },

    sorting = {
      priority_weight = 2,
      comparators = {
        cmp.config.compare.score,
        cmp.config.compare.offset,
        cmp.config.compare.length,
        -- cmp.config.compare.kind,
        -- cmp.config.compare.exact,
        -- cmp.config.compare.recently_used,
        -- cmp.config.compare.sort_text,
        -- cmp.config.compare.order,
      },
    },

    sources = cmp.config.sources({
        { name = "nvim_lsp", priority = 2 },
        { name = "nvim_lsp_signature_help", priority = 2 },
        { name = "luasnip", priority = 2 },
        { name = "buffer", priority = 1 },
        -- -- { name = "nvim_lua" },
        { name = "path" },
        -- { name = "cmdline" },
        { name = "emoji" },
    }),
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            -- Kind icons
            vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
            -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
            -- NOTE: order matters
            vim_item.menu = ({
                nvim_lsp = "[LSP]",
                nvim_lua = "[Nvim]",
                luasnip = "[Snippet]",
                buffer = "[Buffer]",
                path = "[Path]",
                emoji = "[Emoji]",

                -- nvim_lsp = "",
                -- nvim_lua = "",
                -- luasnip = "",
                -- buffer = "",
                -- path = "",
                -- emoji = "",
            })[entry.source.name]
            return vim_item
        end,
    },
})

-- require('cmp').register_source('nvim_lsp_signature_help', require('cmp_nvim_lsp_signature_help').new())

-- Setup lspconfig.
-- local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require("lspconfig")["clangd"].setup({
--     capabilities = capabilities,
-- })
