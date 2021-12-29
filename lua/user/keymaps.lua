local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

keymap('', "<Space>", "<Nop>", opts)
keymap('', "<S-q>", "<Nop>", opts)

-- Map space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
keymap('n', '{', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
keymap('n', '}', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

-- Clangd
keymap("n", "gp", "<cmd> :ClangdSwitchSourceHeader<CR>", opts)
keymap("n", "g-", "<cmd> vs % <bar> :ClangdSwitchSourceHeader<CR>", opts)

-- Tmux navigation
keymap("n", "<M-h>", ":TmuxNavigateLeft<CR>", opts)
keymap("n", "<M-j>", ":TmuxNavigateDown<CR>", opts)
keymap("n", "<M-k>", ":TmuxNavigateUp<CR>", opts)
keymap("n", "<M-l>", ":TmuxNavigateRight<CR>", opts)

-- Fugitive
keymap("n", "<leader>mc", ":Git commit<CR>", opts)
keymap("n", "<leader>mm", ":Git checkout<CR>", opts)
keymap("n", "<leader>mb", ":Git blame<CR>", opts)
keymap("n", "<leader>mr", ":Git checkout .<CR>", opts)
keymap("n", "<leader>mw", ":Gwrite<CR> :Gstatus<CR>", opts)
keymap("n", "<leader>ms", ":Git<CR>", opts)
keymap("n", "<leader>mp", ":Git push<CR>", opts)
keymap("n", "<leader>mu", ":Git pull<CR>", opts)
keymap("n", "<leader>md", ":Gdiff<CR>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("n", "fe", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
keymap("n", "fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
keymap("n", "fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)
keymap("n", "fa", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", opts)
keymap("n", "fw", "<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>", opts)
keymap("n", "fs", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>", opts)
keymap("n", "fr", "<cmd>lua require('telescope.builtin').lsp_references()<cr>", opts)
keymap("n", "fd", "<cmd>lua require('telescope.builtin').lsp_diagnostics()<cr>", opts)
keymap("n", "fi", "<cmd>lua require('telescope.builtin').lsp_implementations()<cr>", opts)
keymap("n", "fk", "<cmd>lua require('telescope.builtin').keymaps()<cr>", opts)
keymap("n", "fo", "<cmd>lua require('telescope.builtin').git_bcommits()<cr>", opts)
keymap("n", "fp", "<cmd>lua require('telescope.builtin').git_commits()<cr>", opts)
keymap("n", "f[", "<cmd>lua require('telescope.builtin').git_branches()<cr>", opts)
keymap("n", "f]", "<cmd>lua require('telescope.builtin').git_status()<cr>", opts)
keymap("n", "fc", ":Telescope neoclip<cr>", opts)
keymap("n", "fm", ":Telescope emoji<cr>", opts)

-- Clang-format
keymap("n", "<Leader>kf", ":ClangFormat<CR>", opts)
keymap("v", "<Leader>kf", ":ClangFormat<CR>", opts)

-- Clipboard Copy
keymap("v", "<C-y>", "\"*y", opts)
keymap("n", "<C-p>", "\"*p", opts)
keymap("v", "<C-c>", ":w !wl-copy<CR><CR>", opts)

-- C-s save
keymap("n", "<C-s>", ":update<CR>", opts)
keymap("v", "<C-s>", "<C-C>:update<CR>", opts)
keymap("i", "<C-s>", "<C-O>:update<CR>", opts)

-- nvim-tree
keymap("n", "<C-n>", ":NvimTreeToggle<CR>", opts)

-- ToggleTerm
keymap("n", "<leader>th", "<cmd>lua _HTOP_TOGGLE()<CR>", opts)
keymap("n", "<leader>tg", "<cmd>lua _GLANCES_TOGGLE()<CR>", opts)
keymap("n", "<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<CR>", opts)
keymap("n", "<leader>tb", "<cmd>lua _BUILDTERM_TOGGLE()<CR>", opts)

-- Beacon
keymap("n", "n", "n:Beacon<cr>", opts)
keymap("n", "N", "N:Beacon<cr>", opts)
keymap("n", "*", "*:Beacon<cr>", opts)
keymap("n", "#", "#:Beacon<cr>", opts)

-- Various
keymap("n", "<leader>-", "<cmd>nohlsearch<cr>", opts)
-- keymap("i", "jk", "<ESC>", opts)

keymap("n", "<F4>", "<cmd>Telescope resume<cr>", opts)
keymap("n", "<F5>", "<cmd>Telescope commands<CR>", opts)
keymap("n", "<C-e>", "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>", opts)
keymap("n", "<F8>", "<cmd>TSPlaygroundToggle<cr>", opts)

