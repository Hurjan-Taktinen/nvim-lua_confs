local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

return packer.startup(function(use)
    -- My plugins here
    use("wbthomason/packer.nvim") -- Have packer manage itself
    use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
    use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
    use("numToStr/Comment.nvim")
    use("kyazdani42/nvim-tree.lua")
    use("nvim-lualine/lualine.nvim")
    use("akinsho/toggleterm.nvim")
    use("akinsho/bufferline.nvim")

    -- Navigation
    use("christoomey/vim-tmux-navigator") -- tmux navigator
    -- use "easymotion/vim-easymotion"
    use("justinmk/vim-sneak") -- Relocate cursor quickly within visible buffer
    use("danilamihailov/beacon.nvim") -- Find cursor after jump
    use("ThePrimeagen/harpoon")

    -- Colorschemes
    use("catppuccin/nvim")
    use("folke/tokyonight.nvim")
    use("lunarvim/colorschemes")
    use("lunarvim/darkplus.nvim")
    use("morhetz/gruvbox")
    use("phanviet/vim-monokai-pro")
    use("rose-pine/neovim")
    use("tomasiser/vim-code-dark")
    -- use "Hurjan-Taktinen/vim-code-dark"
    use("tomasr/molokai")
    use("mhartington/oceanic-next")

    -- LSP
    use("neovim/nvim-lspconfig") -- enable LSP
    use("williamboman/nvim-lsp-installer") -- simple to use language server installer
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    })
    use("nvim-treesitter/playground")
    use("nvim-treesitter/nvim-treesitter-context")
    use("jose-elias-alvarez/null-ls.nvim")

    -- Git integration
    use("tpope/vim-fugitive")
    use("tpope/vim-repeat")
    use("lewis6991/gitsigns.nvim")

    -- Completion
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/nvim-cmp") -- The completion plugin
    use("hrsh7th/cmp-buffer") -- buffer completions
    use("hrsh7th/cmp-path") -- path completions
    use("hrsh7th/cmp-cmdline") -- cmdline completions
    use("saadparwaiz1/cmp_luasnip") -- snippet completions
    -- use("hrsh7th/cmp-emoji")
    use("hrsh7th/cmp-nvim-lua")

    --- TESTING
    use("hrsh7th/cmp-nvim-lsp-signature-help")

    -- Snippets
    use("L3MON4D3/LuaSnip") --snippet engine
    use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

    -- Telescope
    use("nvim-telescope/telescope.nvim")
    use({
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
    })
    use({
        "AckslD/nvim-neoclip.lua",
        requires = { {
            "tami5/sqlite.lua",
            module = "sqlite",
        } },
    })
    use("xiyaowong/telescope-emoji.nvim")

    use("nvim-telescope/telescope-media-files.nvim")
    use("nvim-telescope/telescope-live-grep-args.nvim")

    -- Greeter
    use("kyazdani42/nvim-web-devicons")
    use("goolord/alpha-nvim")

    -- Formatter
    use("rhysd/vim-clang-format")

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
