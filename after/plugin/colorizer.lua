local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
	vim.notify("Module 'colorizer' not found!")
	return
end

colorizer.setup {
	filetypes = { "*" },
	user_defaults_options = {
		RGB = true, -- #RGB hex codes
		RRGGBB = true, -- #RRGGBB hex codes
		names = false, -- "Name" codes like Blue oe blue
		RRGGBBAA = true, -- #RRGGBBAA hex codes
		rgb_fn = true, -- CSS rgb() and rgba() functions
		hsl_fn = true, -- CSS hsl() and hsla() functions
		css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
		css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
		-- Available modes: foreground, background, virtualtext
		mode = "background", -- Set the display mode.)
	},
	bufftypes = {},
}
