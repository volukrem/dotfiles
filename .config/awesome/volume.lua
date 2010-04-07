------------------------------
-- Volume Widget For AwesomeWM 3.4
-- Azer Koculu <azerkoculu@gmail.com>
-- http://azer.kodfabrik.com
-- Wed Apr  7 01:34:35 UTC 2010
------------------------------
local widgetobj = widget({ type = 'textbox', name = 'volume_widget' })
local channel = "vmix0-outvol"

local function increase()
  awful.util.spawn("ossvol -i 3")
  update()
end

local function decrease()
  awful.util.spawn("ossvol -d 3")
  update()
end

local function update()
  local fd = io.popen("ossmix " .. channel)
  widgetobj.text = 'VOL' .. fd:read("*all"):match("(%d+%.%d+)")
  fd:close()
end

local function mute()
  awful.util.spawn("ossvol -t")
end

widgetobj:buttons(awful.util.table.join(
  awful.button({ }, '4', increase),
  awful.button({ }, '5', decrease),
  awful.button({ }, '1', mute)
))

--[[
globalkeys = awful.util.table.join(globalkeys,
  awful.key({ }, "XF86AudioRaiseVolume", increase,
  awful.key({ }, "XF86AudioLowerVolume", decrease,
  awful.key({ }, "XF86AudioMute", function ()
    mute()
  end)
)
]]--

local utimer = timer({ timeout=1 })
utimer:add_signal("timeout", update)
utimer:start()

update()

volume = {
  channel = channel,
  widget = widgetobj,
  increase = increase,
  decrease = decrease,
  mute = mute
}

return volume
