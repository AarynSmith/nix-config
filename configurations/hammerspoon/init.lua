knu = require("hs-knu")
-- Function to guard a given object from GC
guard = knu.runtime.guard
-- Enable auto-restart when any of the *.lua files under ~/.hammerspoon/ is modified
knu.runtime.autorestart(true)

hyper = { "cmd", "alt", "ctrl", "shift" }

-- hs.loadSpoon("SpoonInstall")

-- PaperWM
-- PaperWM = hs.loadSpoon("PaperWM")
-- PaperWM:bindHotkeys({
--     -- switch to a new focused window in tiled grid
--     focus_left  = {hyper , "left"},
--     focus_right = {hyper , "right"},
--     focus_up    = {hyper , "up"},
--     focus_down  = {hyper , "down"},

--     -- move windows around in tiled grid
--     swap_left  = {{"alt", "cmd"}, "left"},
--     swap_right = {{"alt", "cmd"}, "right"},
--     swap_up    = {{"alt", "cmd"}, "up"},
--     swap_down  = {{"alt", "cmd"}, "down"},

--     -- position and resize focused window
--     center_window        = {hyper, "c"},
--     full_width           = {hyper, "f"},
--     cycle_width          = {hyper, "r"},
--     -- reverse_cycle_width  = {{"ctrl", "alt", "cmd"}, "r"},
--     cycle_height         = {{"alt", "cmd", "shift"}, "r"},
--     -- reverse_cycle_height = {{"ctrl", "alt", "cmd", "shift"}, "r"},

--     -- move focused window into / out of a column
--     slurp_in = {hyper, "i"},
--     barf_out = {hyper, "o"},

--     -- move the focused window into / out of the tiling layer
--     toggle_floating = {{"alt", "cmd", "shift"}, "escape"},

--     -- switch to a new Mission Control space
--     switch_space_l = {hyper, ","},
--     switch_space_r = {hyper, "."},
--     switch_space_1 = {hyper, "1"},
--     switch_space_2 = {hyper, "2"},
--     switch_space_3 = {hyper, "3"},
--     switch_space_4 = {hyper, "4"},
--     switch_space_5 = {hyper, "5"},
--     switch_space_6 = {hyper, "6"},
--     switch_space_7 = {hyper, "7"},
--     switch_space_8 = {hyper, "8"},
--     switch_space_9 = {hyper, "9"},

--     -- move focused window to a new space and tile
--     move_window_1 = {{"alt", "cmd", "shift"}, "1"},
--     move_window_2 = {{"alt", "cmd", "shift"}, "2"},
--     move_window_3 = {{"alt", "cmd", "shift"}, "3"},
--     move_window_4 = {{"alt", "cmd", "shift"}, "4"},
--     move_window_5 = {{"alt", "cmd", "shift"}, "5"},
--     move_window_6 = {{"alt", "cmd", "shift"}, "6"},
--     move_window_7 = {{"alt", "cmd", "shift"}, "7"},
--     move_window_8 = {{"alt", "cmd", "shift"}, "8"},
--     move_window_9 = {{"alt", "cmd", "shift"}, "9"}
-- })
-- PaperWM.screen_margin = 0
-- PaperWM.window_gap = 0
-- PaperWM.swipe_fingers = 3
-- PaperWM.swipe_gain = 1.0
-- PaperWM:start()

-- Swipe Gesture
-- local current_id, threshold
-- Swipe = hs.loadSpoon("Swipe")
-- Swipe:start(3, function(direction, distance, id)
--     if id == current_id then
--         if distance > threshold then
--             threshold = math.huge -- trigger once per swipe
--             -- use "natural" scrolling
--             if direction == "left" then
--                 print("got left")
--                 PaperWM.actions.focus_right()
--             elseif direction == "right" then
--                 print("got right")
--                 PaperWM.actions.focus_left()
--             elseif direction == "up" then
--                 print("got up")
--                 PaperWM.actions.focus_down()
--             elseif direction == "down" then
--                 print("got down")
--                 PaperWM.actions.focus_up()
--             end
--         end
--     else
--         current_id = id
--         threshold = 0.2 -- swipe distance > 20% of trackpad size
--     end
-- end)

hs.hotkey.bind(nil, "f4", function()
  hs.hid.capslock.toggle()
end)

hs.hotkey.bind(hyper, "0", function()
  hs.reload()
end)

myDoKeyStroke = function(modifiers, character)
  local event = require("hs.eventtap").event
  event.newKeyEvent(modifiers, string.lower(character), true):post()
  event.newKeyEvent(modifiers, string.lower(character), false):post()
end

hs.hotkey.bind(hyper, "delete", function()
  myDoKeyStroke(nil,"forwardDelete")
end, nil, function()
  myDoKeyStroke(nil,"forwardDelete")
end)

hs.hotkey.bind(hyper, "r", nil, function()
  myDoKeyStroke({"cmd"},"r")
end)

hs.hotkey.bind(hyper, "s", nil, function()
  myDoKeyStroke({"cmd"},"s")
end)

hs.hotkey.bind(hyper, "c", nil, function()
  myDoKeyStroke({"ctrl"},"c")
end)

hs.hotkey.bind(hyper, "v", nil, function()
  hs.eventtap.keyStrokes(hs.pasteboard.getContents())
end)

hs.hotkey.bind(hyper, "m", nil, function()
  myDoKeyStroke({"ctrl", "cmd"},"space")
end)

hs.hotkey.bind(hyper, "p", nil, function()
  myDoKeyStroke({"cmd", "shift"},"p")
end)

hs.hotkey.bind(hyper, "1", nil, function()
  myDoKeyStroke({"cmd", "option"},"1")
end)

hs.hotkey.bind(hyper, "2", nil, function()
  myDoKeyStroke({"cmd", "option"},"2")
end)

hs.hotkey.bind(hyper, "3", nil, function()
  myDoKeyStroke({"cmd", "option"},"3")
end)

--- Double ctrl
-- ctrlDoublePress = require("double_ctrl")
-- ctrlDoublePress.timeFrame = 2
-- ctrlDoublePress.action = function()
--   myDoKeyStroke(hyper, 't')
--   print("hello")
-- end

-- hs.hotkey.bind(hyper, "w", nil, function()
--   local alert = require("hs.alert")
--   alert.show("Stopping PaperWM" , alertStyle, hs.screen.mainScreen(), '');
--   PaperWM:stop()
-- end)


--- Double Hyper
double_hyper = require("double_hyper")
double_hyper.timeFrame = .5
double_hyper.action = function()
  -- print(hs.window.focusedWindow():application():name())
  -- hs.notify.new({title="HammerSpoon", informativeText="Current App" .. hs.window.focusedWindow()}):send()
  -- if hs.window.focusedWindow():application():name() == "Firefox" then
    -- hs.eventtap.keyStroke({}, "BACKSPACE")
  -- else
    hs.eventtap.keyStroke({}, "ESCAPE")
  -- end
end

chord_D = function()
  if hs.window.focusedWindow():application():name() == "Code" then
    hs.eventtap.keyStroke({"cmd","alt"} ,"0")
  end
end

-- --- Chord Shortcuts
hyper_chord = require("hyper_chord")
hyper_chord.chords = {
  -- ["j"]=function() hs.alert("Hyper+K -> J") end,
  -- ["d"]=chord_D
}
hyper_chord.bind();

-- hs.notify.new({title="HammerSpoon", informativeText="Config Loaded"}):send()
