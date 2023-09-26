local status_ok, colors = pcall(require, "onedark.colors")
if not status_ok then
    return
end

local status_scr, scrollbar = pcall(require, "scrollbar")
if not status_scr then
    return
end

scrollbar.setup({
    handle = {
        color = colors.bg_highlight,
    },
    marks = {
        Search = { color = colors.orange },
        Error = { color = colors.error },
        Warn = { color = colors.warning },
        Info = { color = colors.info },
        Hint = { color = colors.hint },
        Misc = { color = colors.purple },
    }
})
