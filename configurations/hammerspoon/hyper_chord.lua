local module = {}

module.chordKey = "k"
module.hyper = {"cmd","ctrl","shift","alt"}
module.chords = {}
module.timeFrame = 2


local alert = require("hs.alert")
local timer = require("hs.timer")
local et = require("hs.eventtap")
local keys = hs.keycodes.map

local alertStyle = {
    strokeWidth  = 2,
    strokeColor = { white = 1, alpha = 1 },
    fillColor   = { white = 0, alpha = 0.75 },
    textColor = { white = 1, alpha = 1 },
    textFont  = ".AppleSystemUIFont",
    textSize  = 27,
    radius = 0,
    atScreenEdge = 2,
    fadeInDuration = 0.15,
    fadeOutDuration = 0.15,
    padding = 3,
}

-- alert.defaultStyle = alertStyle
module.bind = function()
	print("HyperChord: Binding ✧+"..module.chordKey)
	 hs.hotkey.bind(hyper, module.chordKey, nil, function() 
	runTap();
  end)
end



function runTap()
	local alertUUID = alert.show("(✧+"..module.chordKey..") was pressed. Waiting for second key" , alertStyle, hs.screen.mainScreen(), '')
	keypressed = false
	keypressedFn = function()
		alert.closeSpecific(alertUUID)
		if (keypressed == false) then 
			alert.show("hyperchord timed out",alertStyle);
		end
		evtap:stop()
		timer:stop()
	end

	evtap = et.new({et.event.types.keyDown}, function(e)
		keypressed = truek
		keypressedFn();
		if (module.chords[keys[e:getKeyCode()]] ~= nil) then
			module.chords[keys[e:getKeyCode()]]()
			return true -- Stop event from propogating
		end
		return false
	end)
	timer = hs.timer.doAfter(5, keypressedFn)
	evtap:start()
  end

return module