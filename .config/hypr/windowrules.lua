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

hl.window_rule({ name = "move-mpv", match = { class = "^(mpv)$" }, float = true, center = true, workspace = "5" })

-- Layer Rules

hl.layer_rule = {
	name = "noctalia-shell",
	match = { namespace = "noctalia-shell:regionSelector" },
	no_anim = true,
}

hl.layer_rule = {
	name = "noctalia",
	match = { namespace = "noctalia-background-.*$" },
	ignore_alpha = 0.5,
	blur = true,
	blur_popups = true,
}
