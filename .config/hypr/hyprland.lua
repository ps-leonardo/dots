-- Autostart

hl.on("hyprland.start", function()
	hl.exec_cmd("/home/leonardo/.local/share/scripts/resetxdgportal.sh") -- reset XDPH for screenshare
	hl.exec_cmd("dbus-update-activation-environment") --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP -- for XDPH
	hl.exec_cmd("dbus-update-activation-environment") --systemd --all -- for XDPH
	hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP") -- for XDPH
	hl.exec_cmd("systemctl --user start hyprpolkitagent") -- authentication dialogue for GUI apps
	hl.exec_cmd("qs -c noctalia-shell")
	hl.exec_cmd("gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'")
end)

-- Env

--hl.env("PATH", "$PATH:/home/leonardo/.local/share/scripts")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("GDK_SCALE", "1")
hl.env("GTK_IM_MODULE", "ibus")
hl.env("EDITOR", "nvim")
hl.env("READER", "zathura")
hl.env("TERMINAL", "kitty")
hl.env("IMAGE", "imv")
hl.env("OPENER", "xdg-open")
hl.env("BROWSER", "zen-browser")

-- Gaming

hl.env("PROTON_FSR4_UPGRADE", "1")
-- hl.env("PROTON_FSR4_INDICATOR, 1
-- hl.env("PROTON_FSR4_RDNA3_UPGRADE, 1
hl.env("PROTON_ENABLE_WAYLAND", "1")
hl.env("PROTON_NO_WM_DECORATION", "1")
hl.env("PROTON_ENABLE_HDR", "1")
hl.env("PROTON_USE_NTSYNC", "1")
hl.env("PROTON_ENABLE_MESA_ANTI_LAG", "1")

-- Input

hl.config({
	input = {
		kb_layout = "br",
		follow_mouse = 1,
		sensitivity = -0.5,
		force_no_accel = 0,
		numlock_by_default = 1,
	},
})

-- Layouts

hl.config({
	dwindle = {
		preserve_split = true,
	},
	master = {
		new_status = "master",
	},
	scrolling = {
		column_width = 1,
		follow_focus = true,
	},
})

-- Other stuff
hl.config({
	misc = {
		vrr = 0,
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
		force_default_wallpaper = 0,
	},
	xwayland = {
		force_zero_scaling = true,
	},
	render = {
		cm_auto_hdr = 1,
	},
})

-- Look and feel

hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 10,
		layout = "dwindle",
		resize_on_border = false,
	},
	decoration = {
		rounding = 20,
		rounding_power = 2,
		blur = {
			enabled = true,
			size = 3,
			passes = 2,
			new_optimizations = true,
			ignore_opacity = true,
			xray = false,
			vibrancy = 0.1696,
		},
		shadow = {
			enabled = false,
		},
	},
})

require("animations")
require("keybindings")
require("windowrules")
require("monitors")
require("noctalia/noctalia-colors")
