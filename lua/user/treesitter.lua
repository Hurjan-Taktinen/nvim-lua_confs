local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.cpp = {
    install_info = {
        url = "~/dev/git/tree-sitter-cpp", -- local path or git repo
        files = {"src/parser.c", "src/scanner.cc"},
    },
    -- requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
}

configs.setup({
    ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
    ignore_install = { "" }, -- List of parsers to ignore installing
    highlight = {
        enable = true, -- false will disable the whole extension
        disable = { "" }, -- list of language that will be disabled
        additional_vim_regex_highlighting = true,
    },
    autopairs = {
        enable = true,
    },
    indent = { enable = true, disable = { "yaml", "python", "c", "cpp"} },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
    autotag = {
        enable = true,
        disable = { "xml" },
    },
    playground = {
        enable = true,
    },
})

require'treesitter-context'.setup{}
