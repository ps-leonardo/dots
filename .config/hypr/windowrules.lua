-- Window Rules

hl.window_rule({ match = { class = "^(zen)$", title = "^(Picture-in_Picture)$" }, float = true })
hl.window_rule({ match = { class = "^(zen)$", title = "^(Library)$" }, float = true })
hl.window_rule({ match = { class = "^(kvantummanager)$" }, float = true })
hl.window_rule({ match = { class = "^(qt5ct)$" }, float = true })
hl.window_rule({ match = { class = "^(qt6ct)$" }, float = true })
hl.window_rule({ match = { class = "^(nwg-look)$" }, float = true })
hl.window_rule({ match = { class = "^(org.pulseaudio.pavucontrol)$" }, float = true })
hl.window_rule({ match = { class = "^(blueman-manager)$" }, float = true })
hl.window_rule({ match = { class = "^(net.davidotek.pupgui2)$" }, float = true })
hl.window_rule({ match = { class = "imv" }, float = true })

hl.window_rule({ name = "move-spotify", match = { class = "^(Spotify)$" }, workspace = "special" })
--hl.window_rule({ name = "move-steam", match = { class = "^(steam)$" }, workspace = 3 })
hl.window_rule({ name = "move-equibop", match = { class = "^(equibop)$" }, workspace = 4 })
hl.window_rule({ name = "move-mpv", match = { class = "^(mpv)$" }, float = true, center = true, workspace = "5" })

-- Layer Rules

hl.layer_rule({
	name = "noctalia",
	match = {
		namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd|window-switcher)$",
	},
	no_anim = true,
	ignore_alpha = 0.5,
	blur = true,
	blur_popups = true,
})

-- Noctalia Settings
hl.window_rule({
	match = { class = "dev.noctalia.Noctalia" },
	float = true,
	size = { 1080, 920 },
})
