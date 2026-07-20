-- Monitors

hl.monitor({
	output = "DP-1",
	mode = "2560x1080@75",
	position = "0x0",
	scale = 1,
	supports_wide_color = 0,
	supports_hdr = 0,
	sdr_min_luminance = 0.005,
	sdr_max_luminance = 250,
})

hl.monitor({
	output = "DP-2",
	mode = "1366x768",
	position = "2560x312",
	scale = 1,
	supports_wide_color = -1,
	supports_hdr = 1,
})

-- Workspaces

hl.workspace_rule({ workspace = "1", monitor = "DP-1", persistent = true })
hl.workspace_rule({ workspace = "2", monitor = "DP-2", persistent = true, layout = "scrolling" })
hl.workspace_rule({ workspace = "3", monitor = "DP-1", persistent = true })
hl.workspace_rule({ workspace = "4", monitor = "DP-2", persistent = true })
hl.workspace_rule({ workspace = "5", monitor = "DP-1", persistent = true })
hl.workspace_rule({ workspace = "6", monitor = "DP-2", persistent = true })
hl.workspace_rule({ workspace = "7", monitor = "DP-1", persistent = true })
hl.workspace_rule({ workspace = "8", monitor = "DP-2", persistent = true })
hl.workspace_rule({ workspace = "9", monitor = "DP-1", persistent = true })
hl.workspace_rule({ workspace = "10", monitor = "DP-2", persistent = true })
