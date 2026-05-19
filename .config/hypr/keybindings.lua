-- Keybinds

local mainMod = "SUPER"
local ipc = "qs -c noctalia-shell ipc call"

-- Assign apps
local term = "kitty"
local editor = "kitty -e nvim"
local file = "kitty -e yazi"
local browser = "zen-browser"

-- Window/Session actions
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + W", hl.dsp.window.float({ action = "toggle" }))
hl.bind("ALT + RETURN", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd(ipc .. " lockScreen lock"))

-- Application shortcuts
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(file))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(editor))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(browser))
hl.bind("CTRL + SHIFT + ESCAPE", hl.dsp.exec_cmd(term .. "-e btop"))

hl.bind(mainMod .. " + A", hl.dsp.exec_cmd(ipc .. " launcher toggle"))

--TODO: CHECK AUDIOCONTROL
-- Audio control

-- Media control
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))

-- Screenshot/Screencapture
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd(ipc .. " plugin:screen-shot-and-record screenshot"))
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd(ipc .. " plugin:screen-shot-and-record recordsound"))

-- Custom scripts
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd(ipc .. " wallpaper toggle"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(ipc .. " launcher clipboard"))
hl.bind(
	mainMod .. " + SPACE",
	hl.dsp.exec_cmd("hyprctl switchxkblayout 'logitech-g915-wireless-rgb-mechanical-gaming-keyboard', next")
)

-- Move/Change window focus
hl.bind(mainMod .. " + LEFT", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + RIGHT", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + UP", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + DOWN", hl.dsp.focus({ direction = "right" }))

-- Switch workspaces
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })

-- Resize windows
hl.bind(mainMod .. " + SHIFT + RIGHT", hl.dsp.window.resize({ x = 30, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + LEFT", hl.dsp.window.resize({ x = -30, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + UP", hl.dsp.window.resize({ x = 0, y = 30, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + DOWN", hl.dsp.window.resize({ x = 0, y = -30, relative = true }), { repeating = true })

-- Scroll through existing workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/Switch to special workspace (scratchpad)
hl.bind(mainMod .. " + ALT + S", hl.dsp.window.move({ workspace = "special" }))
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special())
