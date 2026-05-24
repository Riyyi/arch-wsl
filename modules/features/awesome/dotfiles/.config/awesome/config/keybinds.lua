local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")

local F = require("config.keybind-functions")
local B = F.add_button
local K = F.add_keybind

--------------------------------------------
-- keybinds

---## General ##---

K({ MOD }, "Return", F.launch_terminal,   { desc = "open terminal",    group = "launcher" })
K({ MOD }, "d",      F.show_app_launcher, { desc = "app launcher",     group = "launcher" })
K({ MOD }, "o",      F.show_menubar,      { desc = "menubar launcher", group = "launcher" }) -- fallback for app launcher
K({ MOD }, "p",      F.run_lua_prompt,    { desc = "run lua prompt",   group = "launcher" })
-- TODO: lockscreen keybind

---## Control ##---

K({ MOD, "Control" }, "r",     awesome.restart,         { desc = "reload awesome",      group = "awesome" })
K({ MOD, "Shift" },   "m",     awesome.quit,            { desc = "quit awesome",        group = "awesome" })
K({ MOD, "Shift" },   "slash", hotkeys_popup.show_help, { desc = "show hotkey overlay", group = "awesome" })

-- TODO: printscreen keybinds

---## Client ##---

K({ MOD },         "q", F.close_client,      { desc = "close",             group = "client" }, "client")
K({ MOD, "Shift"}, "q", F.close_all_clients, { desc = "close all clients", group = "client" }, "client")

--# State/flags #--

K({ MOD }, "f",     F.toggle_fullscreen,  { desc = "toggle fullscreen",                  group = "client" }, "client")
K({ MOD }, "g",     F.toggle_maximize,    { desc = "toggle maximize",                    group = "client" }, "client")
K({ MOD }, "space", F.toggle_floating,    { desc = "toggle floating",                    group = "client" }, "client")
K({ MOD }, "r",     F.cycle_master_width, { desc = "cycle master width (1/3, 1/2, 2/3)", group = "layout" })

--# Focus #--

K({ MOD }, "h", F.focus_direction("left"),  { desc = "focus client left",  group = "client" })
K({ MOD }, "l", F.focus_direction("right"), { desc = "focus client right", group = "client" })
K({ MOD }, "k", F.focus_direction("up"),    { desc = "focus client up",    group = "client" })
K({ MOD }, "j", F.focus_direction("down"),  { desc = "focus client down",  group = "client" })

K({ MOD }, "Left",  F.focus_direction("left"),  { desc = "focus client left",  group = "client" })
K({ MOD }, "Right", F.focus_direction("right"), { desc = "focus client right", group = "client" })
K({ MOD }, "Up",    F.focus_direction("up"),    { desc = "focus client up",    group = "client" })
K({ MOD }, "Down",  F.focus_direction("down"),  { desc = "focus client down",  group = "client" })

for i = 1, 9 do
    K({ MOD }, "#" .. i + 9, F.view_tag(i),  { desc = "view tag #" .. i,  group = "tag" })
end
    K({ MOD }, "#19",        F.view_tag(10), { desc = "view tag #10",     group = "tag" }) -- 0

K({ MOD }, "minus", F.view_prev,               { desc = "focus tag prev",     group = "tag" })
K({ MOD }, "equal", F.view_next,               { desc = "focus tag next",     group = "tag" })

K({ MOD }, "grave", awful.tag.history.restore, { desc = "focus tag last", group = "tag" })

K({ MOD }, "bracketleft",  F.focus_monitor("left"),  { desc = "focus monitor left",  group = "screen" })
K({ MOD }, "bracketright", F.focus_monitor("right"), { desc = "focus monitor right", group = "screen" })

--# Move #--

K({ MOD, "Shift" }, "h", F.move_to_direction("left"),  { desc = "move client left",  group = "client" }, "client")
K({ MOD, "Shift" }, "l", F.move_to_direction("right"), { desc = "move client right", group = "client" }, "client")
K({ MOD, "Shift" }, "k", F.move_to_direction("up"),    { desc = "move client up",    group = "client" }, "client")
K({ MOD, "Shift" }, "j", F.move_to_direction("down"),  { desc = "move client down",  group = "client" }, "client")

K({ MOD, "Shift" }, "Left",  F.move_to_direction("left"),  { desc = "move client left",  group = "client" }, "client")
K({ MOD, "Shift" }, "Right", F.move_to_direction("right"), { desc = "move client right", group = "client" }, "client")
K({ MOD, "Shift" }, "Up",    F.move_to_direction("up"),    { desc = "move client up",    group = "client" }, "client")
K({ MOD, "Shift" }, "Down",  F.move_to_direction("down"),  { desc = "move client down",  group = "client" }, "client")

for i = 1, 9 do
    K({ MOD, "Shift" }, "#" .. i + 9, F.move_client_to_tag(i),  { desc = "move focused client to tag #" .. i, group = "tag" }, "client")
end
    K({ MOD, "Shift" }, "#19",        F.move_client_to_tag(10), { desc = "move focused client to tag #10",    group = "tag" }, "client") -- 0

K({ MOD, "Shift" }, "minus", F.move_client_tag("left"),  { desc = "move client to tag left",  group = "tag" }, "client")
K({ MOD, "Shift" }, "equal", F.move_client_tag("right"), { desc = "move client to tag right", group = "tag" }, "client")

K({ MOD, "Shift" }, "bracketleft",  F.move_client_monitor("left"),  { desc = "move client to monitor left",  group = "screen" }, "client")
K({ MOD, "Shift" }, "bracketright", F.move_client_monitor("right"), { desc = "move client to monitor right", group = "screen" }, "client")

--# Resize #--

K({ MOD, ALT }, "h", F.resize("left", -50),  { desc = "decrease client width",  group = "layout" }, "client")
K({ MOD, ALT }, "l", F.resize("right", -50), { desc = "increase client width",  group = "layout" }, "client")
K({ MOD, ALT }, "j", F.resize("down", -50),  { desc = "decrease client height", group = "layout" }, "client")
K({ MOD, ALT }, "k", F.resize("up", -50),    { desc = "increase client height", group = "layout" }, "client")

K({ MOD, ALT }, "Left",  F.resize("left", -50),  { desc = "decrease client width",  group = "layout" }, "client")
K({ MOD, ALT }, "Right", F.resize("right", -50), { desc = "increase client width",  group = "layout" }, "client")
K({ MOD, ALT }, "Down",  F.resize("down", -50),  { desc = "decrease client height", group = "layout" }, "client")
K({ MOD, ALT }, "Up",    F.resize("up", -50),    { desc = "increase client height", group = "layout" }, "client")

--------------------------------------------
-- buttons

--# Menu #--

B({ }, MOUSE.RIGHT, F.toggle_mymainmenu)

--# Focus #--

B({ },     MOUSE.LEFT,  F.activate_client, "client")
B({ MOD }, MOUSE.LEFT,  F.activate_and_move, "client")
B({ MOD }, MOUSE.RIGHT, F.activate_and_resize, "client")

--------------------------------------------

root.keys(globalkeys)
root.buttons(globalbuttons)
