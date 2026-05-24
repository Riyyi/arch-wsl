local awful = require("awful")
local gears = require("gears")
local menubar = require("menubar")

local M = {}

function M.add_button(modifiers, button, lambda, scope)
    local entry = awful.button(modifiers, button, lambda)

    if scope == "client" then
        clientbuttons = gears.table.join(clientbuttons or {}, entry)
    else
        globalbuttons = gears.table.join(globalbuttons or {}, entry)
    end
end

function M.add_keybind(modifiers, key, lambda, metadata, scope)
    -- rename desc -> description
    if metadata and metadata.desc then
        metadata.description = metadata.desc
        metadata.desc = nil
    end

    local entry = awful.key(modifiers, key, lambda, metadata)

    if scope == "client" then
        clientkeys = gears.table.join(clientkeys or {}, entry)
    else
        globalkeys = gears.table.join(globalkeys or {}, entry)
    end
end

function M.move_to_direction(dir)
    return function(c)
        awful.client.swap.bydirection(dir, c, nil)
    end
end

function M.focus_direction(dir)
    return function()
        awful.client.focus.bydirection(dir)
    end
end

function M.resize(direction, amount)
    return function(c)
        if direction == "up" then
            c:relative_move(0, 0, 0, amount)
        elseif direction == "down" then
            c:relative_move(0, 0, 0, -amount)
        elseif direction == "left" then
            c:relative_move(0, 0, amount, 0)
        elseif direction == "right" then
            c:relative_move(0, 0, -amount, 0)
        end
    end
end

function M.view_prev()
    awful.tag.viewprev()
end

function M.view_next()
    awful.tag.viewnext()
end

function M.toggle_floating(c)
    c.floating = not c.floating
    c:raise()
end

function M.toggle_fullscreen(c)
    c.fullscreen = not c.fullscreen
    c:raise()
end

function M.cycle_layout()
    awful.layout.inc(1)
end

function M.cycle_master_width()
    local tag = awful.screen.focused().selected_tag
    if not tag then return end
    local w = tag.master_width_factor or 0.5
    local values = { 0.33, 0.5, 0.66 }
    for i, v in ipairs(values) do
        if math.abs(w - v) < 0.01 then
            tag.master_width_factor = values[i % #values + 1]
            return
        end
    end
    tag.master_width_factor = 0.5
end

function M.close_client(c)
    c:kill()
end

function M.close_all_clients(c)
    local class = c.class
    for _, cc in ipairs(client.get()) do
        if cc.class == class then
            cc:kill()
        end
    end
end

function M.launch_terminal()
    awful.spawn(terminal)
end

function M.focus_monitor(dir)
    offset = dir == "left" and -1 or 1
    return function()
        awful.screen.focus_relative(offset)
    end
end

function M.view_tag(i)
    return function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
            tag:view_only()
        end
    end
end

function M.move_client_to_tag(i)
    return function(c)
        local tag = c.screen.tags[i]
        if tag then
            c:move_to_tag(tag)
        end
    end
end

function M.move_client_tag(dir)
    return function(c)
        local tag = c.screen.selected_tag
        if tag then
            local idx = tag.index
            if dir == "left" and idx > 1 then
                c:move_to_tag(c.screen.tags[idx - 1])
            elseif dir == "right" and idx < #c.screen.tags then
                c:move_to_tag(c.screen.tags[idx + 1])
            end
        end
    end
end

function M.move_client_monitor(dir)
    offset = dir == "left" and -1 or 1
    return function(c)
        c:move_to_screen(c.screen.index + offset)
    end
end

function M.toggle_maximize(c)
    c.maximized = not c.maximized
    c:raise()
end

function M.activate_client(c)
    c:emit_signal("request::activate", "mouse_click", { raise = true })
end

function M.activate_and_move(c)
    c:emit_signal("request::activate", "mouse_click", { raise = true })
    awful.mouse.client.move(c)
end

function M.activate_and_resize(c)
    c:emit_signal("request::activate", "mouse_click", { raise = true })
    awful.mouse.client.resize(c)
end

function M.show_menubar()
    menubar.show()
end

function M.run_lua_prompt()
    awful.screen.focused().mypromptbox:run()
end

function M.toggle_mymainmenu()
    mymainmenu:toggle()
end

function M.show_app_launcher()
    require("config.app-launcher").show()
end

function M.power_off()
    awful.spawn("systemctl poweroff")
end

function M.suspend()
    awful.spawn("systemctl suspend")
end

function M.reboot()
    awful.spawn("systemctl reboot")
end

return M
