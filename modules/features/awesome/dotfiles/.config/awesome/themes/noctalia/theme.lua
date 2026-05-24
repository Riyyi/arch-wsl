local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local theme = {}

theme.font = "DejaVu Sans Mono 11"

theme.bg_normal     = "#1e2127"
theme.bg_focus      = "#282c34"
theme.bg_urgent     = "#e06c75"
theme.bg_minimize   = "#3e4451"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#abb2bf"
theme.fg_focus      = "#61afef"
theme.fg_urgent     = "#e06c75"
theme.fg_minimize   = "#5c6370"

theme.useless_gap   = dpi(6)
theme.border_width  = dpi(4)
theme.border_normal = "#3e4451"
theme.border_focus  = "#61afef"
theme.border_urgent = "#e06c75"
theme.border_marked = "#e06c75"

theme.taglist_bg_focus = "#282c34"
theme.taglist_bg_focus_underline = "#61afef"
theme.taglist_fg_focus = "#abb2bf"
theme.taglist_bg_urgent = "#282c34"
theme.taglist_fg_urgent = "#e06c75"
theme.taglist_bg_occupied = "#1e2127"
theme.taglist_fg_occupied = "#5c6370"
theme.taglist_bg_empty = "#1e2127"
theme.taglist_fg_empty = "#282c34"

theme.tasklist_bg_focus = "#282c34"
theme.tasklist_fg_focus = "#61afef"
theme.tasklist_bg_urgent = "#282c34"
theme.tasklist_fg_urgent = "#e06c75"

theme.titlebar_bg_normal = "#1e2127"
theme.titlebar_fg_normal = "#abb2bf"
theme.titlebar_bg_focus = "#282c34"
theme.titlebar_fg_focus = "#61afef"

theme.tooltip_bg = "#282c34"
theme.tooltip_fg = "#abb2bf"
theme.tooltip_border_color = "#61afef"

theme.notification_bg = "#282c34"
theme.notification_fg = "#abb2bf"
theme.notification_border_color = "#61afef"

theme.menu_bg = "#282c34"
theme.menu_fg = "#abb2bf"
theme.menu_border_color = "#61afef"
theme.menu_height = dpi(20)
theme.menu_width = dpi(150)


theme.wallpaper = os.getenv("HOME") .. "/Pictures/Wallpapers/wallpaper.png"

theme.menu_submenu_icon = themes_path.."default/submenu.png"

theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

theme.icon_theme = "Papirus"

return theme
