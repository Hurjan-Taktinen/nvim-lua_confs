local status_ok, telescope_emoji = pcall(require, "telescope-emoji")
if not status_ok then
    return
end

telescope_emoji.setup({
    action = function(emoji)
        -- argument emoji is a table.
        -- {name="", value="", cagegory="", description=""}
        vim.fn.setreg("*", emoji.value)
        print([[Press p or "*p to paste this emoji]] .. emoji.value)
    end,
})
