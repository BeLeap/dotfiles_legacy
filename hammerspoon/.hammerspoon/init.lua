local events = hs.eventtap.event.types
keyboardTracker = hs.eventtap.new({ events.keyDown }, function(e)
  local keyCode = e:getKeyCode()
  if keyCode == hs.keycodes.map["rightcmd"] then
    print("hi")
    hs.notify.new({ title = "foo" }):send()
  end
end)
keyboardTracker:start()

function leftClickCurrPos()
  hs.eventtap.leftClick(hs.mouse.absolutePosition())
end

function focusScreen(screen)
  local pt = hs.geometry.rectMidPoint(screen:fullFrame())
  hs.mouse.setAbsolutePosition(pt)
end

hs.hotkey.bind({ "option" }, "l", function()
  focusScreen(hs.window.focusedWindow():screen():next())
  leftClickCurrPos()
end)

hs.hotkey.bind({ "option" }, "n", function()
  local script = [[
    on run {input, parameters}
      tell application "System Events" to tell process "Notification Center"
          try
              click last item of windows
          end try
      end tell
      return input
    end run
  ]]
  hs.osascript.applescript(script)
end)
