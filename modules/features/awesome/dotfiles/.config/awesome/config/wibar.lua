local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

--------------------------------------------
-- tag widget

-- Distribute tags across multiple monitors
local function tags_per_monitor(s)
	-- local screen_count = screen.count()
	local screen_idx = s.index or 1
	local tag_labels
	if screen_idx == 1 then
		tag_labels = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "0" }
	else
		tag_labels = { "1", "2" }
	end

	awful.tag(tag_labels, s, awful.layout.layouts[1])
end

local taglist_buttons = gears.table.join(
	awful.button({}, MOUSE.LEFT, function(t) t:view_only() end),
	awful.button({ MOD }, MOUSE.LEFT, function(t)
		if client.focus then
			client.focus:move_to_tag(t)
		end
	end),
	awful.button({}, MOUSE.RIGHT, awful.tag.viewtoggle),
	awful.button({ MOD }, MOUSE.RIGHT, function(t)
		if client.focus then
			client.focus:toggle_tag(t)
		end
	end),
	awful.button({}, MOUSE.SCROLL_UP, function(t) awful.tag.viewprev(t.screen) end),
	awful.button({}, MOUSE.SCROLL_DOWN, function(t) awful.tag.viewnext(t.screen) end)
)

local function update_underline(self, tag)
	local underline = self:get_children_by_id("underline_role")[1]
	if underline then
		underline.bg = tag.selected and beautiful.taglist_bg_focus_underline or beautiful.bg_normal
	end
end

local function create_taglist_widget(s)
	s.mytaglist = awful.widget.taglist {
		screen          = s,
		filter          = awful.widget.taglist.filter.all,
		buttons         = taglist_buttons,
		widget_template = {
			{
				{
					{
						id     = "text_role",
						widget = wibox.widget.textbox,
					},
					left   = 8,
					right  = 8,
					top    = 4,
					bottom = 3,
					widget = wibox.container.margin,
				},
				id     = "background_role",
				widget = wibox.container.background,
			},
			{
				wibox.widget.base.make_widget(), -- NOTE: background won't draw color if it has no child widget
				id            = "underline_role",
				forced_height = 3,
				widget        = wibox.container.background,
			},
			layout          = wibox.layout.fixed.vertical,
			create_callback = update_underline,
			update_callback = update_underline,
		},
	}
end

--------------------------------------------
-- window title widget

local function create_title_widget()
	local icon = wibox.widget {
		widget = wibox.widget.imagebox,
		resize = false,
		forced_width = 18,
		forced_height = 18,
	}
	local title = wibox.widget {
		widget = wibox.widget.textbox,
		align = "center",
		halign = "center",
		ellipsize = "middle",
	}
	local title_constraint = wibox.widget {
		widget = wibox.container.constraint,
		strategy = "max",
		width = 500,
		title,
	}
	local container = wibox.widget {
		layout = wibox.layout.fixed.horizontal,
		spacing = 6,
		icon,
		title_constraint,
	}
	local wrapper = wibox.widget {
		layout = wibox.container.place,
		halign = "center",
		valign = "center",
		container,
	}
	return wrapper, icon, title
end

local title_widgets = {}

-- Per-monitor focused client title
for s in screen do
	local title_widget, title_icon, title_text = create_title_widget()
	title_widgets[s.index] = {
		widget = title_widget,
		icon   = title_icon,
		title  = title_text,
	}
end

local function update_all_titles()
	local c = client.focus
	for s in screen do
		local entry = title_widgets[s.index]
		if entry then
			if c and c.screen == s then
				entry.title.text = c.name or ""
				entry.icon.image = c.icon or nil
			else
				entry.title.text = ""
				entry.icon.image = nil
			end
		end
	end
end

client.connect_signal("property::name", update_all_titles)
client.connect_signal("property::icon", update_all_titles)
client.connect_signal("focus", update_all_titles)
client.connect_signal("unfocus", update_all_titles)

--------------------------------------------
-- volume widget

local volume_text = wibox.widget {
	widget = wibox.widget.textbox,
}

local volume_glyph = wibox.widget {
	widget = wibox.widget.textbox,
	font = "DejaVuSansM Nerd Font 11",
}

volume_widget = wibox.widget {
	layout = wibox.layout.fixed.horizontal,
	spacing = 4,
	volume_glyph,
	volume_text,
}

local current_pct = 0
local current_muted = false

local function update_volume()
	awful.spawn.easy_async_with_shell(
		"pactl get-sink-volume @DEFAULT_SINK@ | head -n1 | cut -d/ -f2 | tr -d ' %' && pactl get-sink-mute @DEFAULT_SINK@ | cut -d: -f2 | tr -d ' '",
		function(stdout)
			local lines = {}
			for line in stdout:gmatch("[^\n]+") do
				table.insert(lines, line)
			end
			current_pct = tonumber(lines[1]) or 0
			current_muted = lines[2] == "yes"

			local log = io.open("/tmp/awesome-log", "a")
			if log then
				log:write(os.date("%Y-%m-%d %H:%M:%S") ..
					" volume_update lines=" .. table.concat(lines, ",") ..
					" muted=" .. (current_muted and "1" or "0") ..
					" pct=" .. current_pct .. " type=" .. type(current_pct) ..
					"\n")
				log:close()
			end

			if current_muted then
				volume_glyph.markup = '<span color="' .. beautiful.fg_minimize .. '"></span>'
				volume_text.markup = '<span color="' .. beautiful.fg_minimize .. '">' .. current_pct .. '%</span>'
			else
				local icon = current_pct < 20 and "" or current_pct < 40 and "" or ""
				volume_glyph.markup = icon .. " " -- NOTE: trailing space is required to render the icon
				volume_text.markup = current_pct .. "%"
			end
		end)
end

local function on_volume_click(_, _, _, button)
	if button == MOUSE.LEFT then
		awful.spawn("pavucontrol")
	elseif button == MOUSE.RIGHT then
		awful.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle", false)
	elseif button == MOUSE.SCROLL_UP then
		local new_pct = math.min(current_pct + 2, 100)
		awful.spawn("pactl set-sink-volume @DEFAULT_SINK@ " .. new_pct .. "%", false)
	elseif button == MOUSE.SCROLL_DOWN then
		local new_pct = math.max(current_pct - 2, 0)
		awful.spawn("pactl set-sink-volume @DEFAULT_SINK@ " .. new_pct .. "%", false)
	end
end

volume_widget:connect_signal("button::press", on_volume_click)
volume_glyph:connect_signal("button::press", on_volume_click)
volume_text:connect_signal("button::press", on_volume_click)

update_volume()

awful.spawn.with_line_callback("pactl subscribe", {
	stdout = function(line)
		if line:find("Event 'change' on sink") then
			update_volume()
		end
	end,
})

--------------------------------------------
-- clock widget

mytextclock = wibox.widget.textclock("%I:%M %p")

local clock_tooltip = awful.tooltip({
	objects = { mytextclock },
	text = os.date("%A, %B %d, %Y"),
	mode = "outside",
	preferred_positions = { "bottom", "top" },
	preferred_align = "right",
})
clock_tooltip:set_margin_leftright(8)
clock_tooltip:set_margin_topbottom(4)
mytextclock:connect_signal("focus", function()
	clock_tooltip.text = os.date("%A, %B %d, %Y")
end)

-------------------------------------------
-- set wallpaper

local function set_wallpaper(s)
	if beautiful.wallpaper then
		local wallpaper = beautiful.wallpaper
		if type(wallpaper) == "function" then
			wallpaper = wallpaper(s)
		end
		gears.wallpaper.tiled(wallpaper, s)
	end
end

screen.connect_signal("property::geometry", set_wallpaper)
--------------------------------------------
-- create bars

awful.screen.connect_for_each_screen(function(s)
	set_wallpaper(s)
	tags_per_monitor(s)
	create_taglist_widget(s)

	s.mypromptbox = awful.widget.prompt()

	s.mywibox = awful.wibar({ position = "top", screen = s })

	s.mywibox:setup {
		layout = wibox.layout.stack,
		{
			layout = wibox.layout.align.horizontal,
			{ -- Left widgets
				layout = wibox.layout.fixed.horizontal,
				s.mytaglist,
				s.mypromptbox,
			},
			nil,
			{ -- Right widgets
				layout = wibox.layout.fixed.horizontal,
				spacing = 10,
				wibox.widget.systray(),
				volume_widget,
				mytextclock,
				mylauncher,
			},
		},
		title_widgets[s.index].widget,
	}
end)
