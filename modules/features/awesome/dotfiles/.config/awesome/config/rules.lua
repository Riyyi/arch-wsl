local awful = require("awful")
local beautiful = require("beautiful")

local function focus_filter(c)
	if c.urgent then
		return true
	end
	if c.hidden then
		return false
	end
	if c.type == "splash" or c.type == "notification" then
		return false
	end
	return true
end

awful.rules.rules = {
	{
		rule = {},
		properties = {
			border_width = beautiful.border_width,
			border_color = beautiful.border_normal,
			decorations = false,
			focus = focus_filter,
			raise = true,
			keys = clientkeys,
			buttons = clientbuttons,
			screen = awful.screen.preferred,
			placement = awful.placement.no_overlap + awful.placement.no_offscreen
		}
	},

	{
		rule_any = {
			instance = { "imv", "mpv" }
		},
		properties = { floating = true }
	},

	{
		rule = { class = "Firefox", name = "Library" },
		properties = { floating = true }
	},

	{
		rule = { class = "Firefox", name = "^About.*" },
		properties = { floating = true }
	},

	{
		rule = { class = "Thunar", name = "File Operation Progress" },
		properties = { floating = true }
	},

	{
		rule = { class = "Thunar", name = "Rename .*" },
		properties = { floating = true }
	},

}
