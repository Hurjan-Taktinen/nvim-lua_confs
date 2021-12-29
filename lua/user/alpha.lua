local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
    return
end

local dashboard = require("alpha.themes.dashboard")

dashboard.section.buttons.val = {
    dashboard.button("f", "   Find file", ":Telescope find_files <CR>"),
    dashboard.button("e", "   New file", ":ene <BAR> startinsert <CR>"),
--     startify.button("p", "   Find project", ":Telescope projects <CR>"),
--     startify.button("r", "   Recent files", ":Telescope oldfiles <CR>"),
--     startify.button("t", "   Find text", ":Telescope live_grep <CR>"),
--     startify.button("s", "   Find Session", ":Telescope sessions save_current=false <CR>"),
    dashboard.button("c", "   Config", ":e ~/.config/nvim/init.lua <CR>"),
    dashboard.button("q", "   Quit", ":qa<CR>"),
}

alpha.setup(dashboard.opts)

-- startify.section.bottom_buttons.val = {
--     startify.button("v", "nvim config", ":e ~/.config/nvim/init.lua<CR>"),
--     startify.button("q", "quit", ":qa<CR>")
-- }


