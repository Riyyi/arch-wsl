local awful = require("awful")
local beautiful = require("beautiful")
local mouse = mouse

local conf_dir = awesome.conffile:match("^(.*)/")
local theme_path = conf_dir .. "/themes/noctalia/theme.lua"
beautiful.init(dofile(theme_path))
-- beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")

terminal = "ghostty"
editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor

MOD = "Mod4"
ALT = "Mod1"

MOUSE = {
	LEFT = 1,
	MIDDLE = 2,
	RIGHT = 3,
	SCROLL_UP = 4,
	SCROLL_DOWN = 5,
}

mouse.object_ignore_screen = true

awful.mouse.client.dirty_on_move = true
awful.mouse.snap.edge_enabled = false
awful.mouse.snap.client_enabled = false

awful.util.spawn("nm-applet")

awful.layout.layouts = {
	awful.layout.suit.tile,
	awful.layout.suit.magnifier,
	awful.layout.suit.floating,
}

-- Prevent new clients from becoming master
client.connect_signal("manage", function(c)
    if awesome.startup then
        return
    end

    awful.client.setslave(c)
end)
