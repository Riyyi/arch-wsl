local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local hotkeys_popup = require("awful.hotkeys_popup")
local wibox = require("wibox")

local B = awful.button
local F = require("config.keybind-functions")

local myawesomemenu = {
	{ "hotkeys",     function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
	{ "manual",      terminal .. " -e man awesome" },
	{ "edit config", editor_cmd .. " " .. awesome.conffile },
	{ "reload",      awesome.restart },
}

local mysystemmenu = {
	{ "sleep",     F.suspend },
	{ "shutdown",  F.power_off },
	{ "reboot",    F.reboot },
	{ "logout",    function() awesome.quit() end },
}

mymainmenu = awful.menu({
	items = {
		{ "awesome",       myawesomemenu, beautiful.awesome_icon },
		{ "system",        mysystemmenu },
		{ "open terminal", terminal },
	},
})

mylauncher = wibox.widget {
	{
		text = "⏻ ", -- NOTE: trailing space is required to render the icon
		align = "center",
		valign = "center",
		widget = wibox.widget.textbox,
	},
	fg = beautiful.fg_urgent,
	buttons = gears.table.join(
		B({}, MOUSE.LEFT,  F.toggle_mymainmenu),
		B({}, MOUSE.RIGHT, F.toggle_mymainmenu)
	),
	widget = wibox.container.background,
}
