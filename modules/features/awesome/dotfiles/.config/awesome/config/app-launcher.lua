local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local menubar = require("menubar")

-- Cached across invocations so we don't re-scan desktop files on every open.
local entries = nil
-- Single state table — nilled by close() so every field resets in one shot.
local state = nil

local function close()
	if not state then return end
	if state.grabber then
		state.grabber:stop()
	end
	if state.popup then
		state.popup.visible = false
	end
	for _, c in ipairs(client.get()) do
		c:disconnect_signal("button::press", state.click_dismiss_handler)
	end
	if state.manage_handler then
		client.disconnect_signal("manage", state.manage_handler)
	end
	if state.old_root_buttons then
		root.buttons(state.old_root_buttons)
	end
	state = nil
end

-- Plain substring match; lowercase both sides for case-insensitive filtering.
-- The `1, true` args anchor the search and disable pattern matching.
local function matches_filter(entry, text)
	if text == "" then return true end
	return string.lower(entry.name):find(string.lower(text), 1, true) ~= nil
end

local function update_filtered_entries()
	if state.filter_text == "" then
		state.filtered_entries = entries
	else
		state.filtered_entries = {}
		for _, entry in ipairs(entries) do
			if matches_filter(entry, state.filter_text) then
				table.insert(state.filtered_entries, entry)
			end
		end
	end
end

local function update_selection()
	for i, row in ipairs(state.row_widgets) do
		if i == state.selected then
			row.bg = beautiful.bg_focus
			row.fg = beautiful.fg_focus
		else
			row.bg = beautiful.bg_normal
			row.fg = beautiful.fg_normal
		end
	end
	if state.scroll_widget and #state.row_widgets > 0 then
		state.scroll_widget:emit_signal("widget::redraw_needed")
	end
end

local function move_selection(delta)
	if #state.filtered_entries == 0 then return end
	state.selected = math.max(1, math.min(#state.filtered_entries, state.selected + delta))
	update_selection()
end

local function launch_selected()
	if #state.filtered_entries > 0 then
		awful.spawn(state.filtered_entries[state.selected].cmdline)
	end
	close()
end

local function populate_rows()
	state.row_widgets = {}

	for i = #state.rows_widget.children, 1, -1 do
		-- Must iterate in reverse; removing a child shifts subsequent indices.
		state.rows_widget:remove(i)
	end

	for i, entry in ipairs(state.filtered_entries) do
		local row_bg = wibox.container.background()
		row_bg.bg = beautiful.bg_normal
		row_bg.fg = beautiful.fg_normal

		local row_content = wibox.widget {
			{
				image = entry.icon,
				resize = true,
				forced_width = 32,
				forced_height = 32,
				widget = wibox.widget.imagebox,
			},
			{
				text = entry.name,
				widget = wibox.widget.textbox,
			},
			spacing = 8,
			layout = wibox.layout.fixed.horizontal,
		}

		row_bg.widget = row_content
		state.rows_widget:add(row_bg)
		state.row_widgets[i] = row_bg
	end

	state.selected = 1
	update_selection()

	if state.result_count_textbox then
		state.result_count_textbox.text = #state.filtered_entries ..
			" app" .. (#state.filtered_entries ~= 1 and "s" or "")
	end
end

local function rebuild()
	update_filtered_entries()
	populate_rows()
	if state.filter_textbox then
		state.filter_textbox.text = state.filter_text
	end
end

local function on_filter_key(key)
	if key == "BackSpace" then
		if #state.filter_text > 0 then
			state.filter_text = string.sub(state.filter_text, 1, -2)
			rebuild()
		end
		return true
	elseif key == "space" then
		state.filter_text = state.filter_text .. " "
		rebuild()
		return true
	elseif #key == 1 then
		state.filter_text = state.filter_text .. key
		rebuild()
		return true
	end
	return false
end

local function build_widgets(screen, launcher_height)
	state.filter_textbox = wibox.widget.textbox()
	state.filter_textbox.text = ""
	state.filter_textbox.forced_height = 20

	local filter_label = wibox.widget.textbox()
	filter_label.text = "Run: "
	filter_label.forced_height = 20

	-- Measure character width using "W" (typically the widest glyph) so the block
	-- cursor scales with the font. get_preferred_size needs a screen object in 4.3.
	local measure_tb = wibox.widget.textbox()
	measure_tb.text = "W"
	local char_width = select(1, measure_tb:get_preferred_size(screen))

	state.cursor_widget = wibox.container.background()
	state.cursor_widget.bg = beautiful.bg_focus
	local cursor_inner = wibox.widget.textbox()
	cursor_inner.text = ""
	cursor_inner.forced_width = char_width
	cursor_inner.forced_height = 20
	state.cursor_widget.widget = cursor_inner

	state.result_count_textbox = wibox.widget.textbox()
	state.result_count_textbox.text = ""

	state.rows_widget = wibox.layout.fixed.vertical()

	state.scroll_widget = wibox.container.scroll.vertical()
	state.scroll_widget:set_widget(state.rows_widget)
	state.scroll_widget:set_speed(0)
	state.scroll_widget:set_step_function(function(_, size, visible_size)
		-- After close(), state is nil — the popup is hidden so this shouldn't
		-- fire, but guard against pending redraws all the same.
		if not state then return 0 end
		-- size = total content height, visible_size = viewport height.
		-- Each row is assumed equal height (size / count). To avoid eager scrolling
		-- we only move scroll_offset when the selected item would be outside the
		-- visible range. min_visible = scroll pos to keep item bottom in view,
		-- max_visible = scroll pos to keep item top in view. Clamping between
		-- them ensures the item is always fully visible with minimal scrolling.
		local count = #state.filtered_entries
		if count == 0 then return 0 end
		local row_height = size / count
		local item_top = (state.selected - 1) * row_height
		local item_bottom = state.selected * row_height
		local max_offset = math.max(0, size - visible_size)
		local min_visible = math.max(0, item_bottom - visible_size)
		local max_visible = math.min(max_offset, item_top)
		state.scroll_offset = math.max(min_visible, math.min(max_visible, state.scroll_offset))
		return state.scroll_offset
	end)

	-- Constrain the scroll widget's visible height so scrolling is triggered.
	-- Without this the layout allocates the full content height and h > height
	-- is never true in calculate_info, so the step function is never called.
	state.scroll_widget:set_max_size(launcher_height - 90)

	update_filtered_entries()
	populate_rows()

	local filter_row = wibox.widget {
		filter_label,
		state.filter_textbox,
		state.cursor_widget,
		layout = wibox.layout.fixed.horizontal,
	}

	return wibox.widget {
		{
			filter_row,
			top = 0,
			bottom = 4,
			widget = wibox.container.margin,
		},
		state.scroll_widget,
		{
			state.result_count_textbox,
			top = 4,
			bottom = 0,
			widget = wibox.container.margin,
		},
		layout = wibox.layout.fixed.vertical,
	}
end

local function wire_dismiss_handlers()
	state.click_dismiss_handler = function()
		if state then close() end
	end

	state.popup:connect_signal("button::press", state.click_dismiss_handler)

	-- root.buttons only fires on the root window background; clicks on clients
	-- are consumed by the client. Connect to each client's button::press too.
	for _, c in ipairs(client.get()) do
		c:connect_signal("button::press", state.click_dismiss_handler)
	end
	state.manage_handler = function(c)
		c:connect_signal("button::press", state.click_dismiss_handler)
	end
	client.connect_signal("manage", state.manage_handler)

	-- Save and restore root buttons so clicks outside the popup dismiss it
	-- without interfering with existing root-level mouse bindings.
	state.old_root_buttons = root.buttons()
	root.buttons(gears.table.join(
		type(state.old_root_buttons) == "table" and state.old_root_buttons or {},
		awful.button({}, 1, state.click_dismiss_handler),
		awful.button({}, 3, state.click_dismiss_handler)
	))
end

local function create_keygrabber()
	state.grabber = awful.keygrabber {
		autostart = true,
		keybindings = {
			{ {},      "Escape", function() close() end },
			{ {},      "Up",     function() move_selection(-1) end },
			{ {},      "Down",   function() move_selection(1) end },
			{ {},      "Return", function() launch_selected() end },
			{ { ALT }, "k",      function() move_selection(-1) end },
			{ { ALT }, "j",      function() move_selection(1) end },
			{ { ALT }, "l",      function() launch_selected() end },
			{ { ALT }, "h",      function() close() end },
		},
		keypressed_callback = function(_, mod, key)
			for _, m in ipairs(mod) do
				if m ~= "Shift" then return end
			end
			on_filter_key(key)
		end,
	}
end

local function build_popup()
	state = {
		filter_text = "",
		row_widgets = {},
		selected = 1,
		scroll_offset = 0,
		filtered_entries = {},
	}

	local screen = awful.screen.focused()
	local workarea = screen.workarea
	local launcher_width = 600
	local launcher_height = math.floor(workarea.height * 0.5)

	local layout = build_widgets(screen, launcher_height)

	state.popup = awful.popup {
		widget = {
			{
				layout,
				top = 20,
				bottom = 0,
				left = 20,
				right = 20,
				widget = wibox.container.margin,
			},
			strategy = "exact",
			width = launcher_width,
			height = launcher_height,
			widget = wibox.container.constraint,
		},
		bg = beautiful.bg_normal,
		fg = beautiful.fg_normal,
		border_color = beautiful.border_focus,
		border_width = 4,
		placement = function(p)
			awful.placement.centered(p, { honor_workarea = true, screen = screen })
		end,
		ontop = true,
		visible = true,
	}

	wire_dismiss_handlers()
	create_keygrabber()
end

-- Calling show() while the popup is already open closes it (toggle behavior).
local function show()
	if state then
		close()
		return
	end

	-- menubar.menu_gen is async; it calls the callback once desktop files are parsed.
	if entries then
		build_popup()
	else
		menubar.menu_gen.generate(function(items)
			entries = items
			build_popup()
		end)
	end
end

return { show = show }
